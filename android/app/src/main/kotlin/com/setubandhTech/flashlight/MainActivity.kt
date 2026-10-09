package com.setubandhTech.flashlight

import android.content.Intent
import android.hardware.camera2.CameraManager
import android.os.Build
import android.provider.Settings
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val CHANNEL = "flashlight/torch"
    private val SETTINGS_CHANNEL = "flashlight/settings"

    private lateinit var cameraManager: CameraManager
    private var torchCallback: CameraManager.TorchCallback? = null

    override fun configureFlutterEngine(
        flutterEngine: FlutterEngine
    ) {
        super.configureFlutterEngine(flutterEngine)

        // -------------------------------------------------------------
        // Flashlight
        // -------------------------------------------------------------

        cameraManager =
            getSystemService(CAMERA_SERVICE) as CameraManager

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->

            when (call.method) {

                "turnOn" -> {
                    val succeeded = FlashlightController.setFlashlight(
                        this,
                        true
                    )

                    if (succeeded) result.success(null)
                    else result.error("TORCH_UNAVAILABLE", "Could not turn on flashlight", null)
                }

                "turnOff" -> {
                    val succeeded = FlashlightController.setFlashlight(
                        this,
                        false
                    )

                    if (succeeded) result.success(null)
                    else result.error("TORCH_UNAVAILABLE", "Could not turn off flashlight", null)
                }

                else -> {
                    result.notImplemented()
                }
            }
        }

        // -------------------------------------------------------------
        // Listen for real flashlight state changes
        // -------------------------------------------------------------

        torchCallback = object : CameraManager.TorchCallback() {

                override fun onTorchModeChanged(
                    cameraId: String,
                    enabled: Boolean
                ) {
                    super.onTorchModeChanged(
                        cameraId,
                        enabled
                    )

                    if (!FlashlightController.onTorchModeChanged(this@MainActivity, cameraId, enabled)) {
                        return
                    }

                    runOnUiThread {
                        MethodChannel(
                            flutterEngine.dartExecutor.binaryMessenger,
                            CHANNEL
                        ).invokeMethod(
                            "torchStateChanged",
                            enabled
                        )
                    }
                }
            }
        cameraManager.registerTorchCallback(torchCallback!!, null)

        // -------------------------------------------------------------
        // Settings
        // -------------------------------------------------------------

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            SETTINGS_CHANNEL
        ).setMethodCallHandler { call, result ->

            when (call.method) {

                "getSystemColor" -> {
                    if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.S) {
                        result.success(getColor(android.R.color.system_accent1_500).toLong() and 0xFFFFFFFFL)
                    } else {
                        result.success(null)
                    }
                }

                "setCallEnabled" -> {

                    val enabled =
                        call.argument<Boolean>("enabled") ?: false

                    FlashAlertPreferences.setCallEnabled(
                        this,
                        enabled
                    )

                    result.success(null)
                }

// -----------------------------------------------------
// Call Flash Mode
// -----------------------------------------------------

                "setCallFlashMode" -> {

                    val mode =
                        call.argument<String>("mode")

                    val enabled =
                        call.argument<Boolean>("enabled") ?: false

                    when (mode) {

                        "ring" -> {

                            FlashAlertPreferences.setCallFlashRing(
                                this,
                                enabled
                            )
                        }

                        "vibrate" -> {

                            FlashAlertPreferences.setCallFlashVibrate(
                                this,
                                enabled
                            )
                        }

                        "silent" -> {

                            FlashAlertPreferences.setCallFlashSilent(
                                this,
                                enabled
                            )
                        }
                    }

                    result.success(null)
                }

                "setSmsEnabled" -> {

                    val enabled =
                        call.argument<Boolean>("enabled") ?: false

                    FlashAlertPreferences.setSmsEnabled(
                        this,
                        enabled
                    )

                    result.success(null)
                }

                "setFlashLength" -> {
                    val onLength = call.argument<Int>("onLength") ?: 300
                    val offLength = call.argument<Int>("offLength") ?: 300
                    FlashAlertPreferences.setOnLength(this, onLength.toLong())
                    FlashAlertPreferences.setOffLength(this, offLength.toLong())
                    result.success(null)
                }

                "getFlashAlertSettings" -> {
                    result.success(
                        mapOf(
                            "call" to FlashAlertPreferences.isCallEnabled(this),
                            "sms" to FlashAlertPreferences.isSmsEnabled(this),
                            "shake" to FlashAlertPreferences.isShakeEnabled(this),
                            "notification" to FlashAlertPreferences.isNotificationEnabled(this),
                            "ring" to FlashAlertPreferences.isCallFlashRing(this),
                            "vibrate" to FlashAlertPreferences.isCallFlashVibrate(this),
                            "silent" to FlashAlertPreferences.isCallFlashSilent(this),
                            "onLength" to FlashAlertPreferences.getOnLength(this).toInt(),
                            "offLength" to FlashAlertPreferences.getOffLength(this).toInt()
                        )
                    )
                }



                "setShakeEnabled" -> {

                    val enabled =
                        call.argument<Boolean>("enabled") ?: false

                    FlashAlertPreferences.setShakeEnabled(
                        this,
                        enabled
                    )

                    if (enabled) {
                        if (!startShakeService()) {
                            FlashAlertPreferences.setShakeEnabled(this, false)
                            result.error("SHAKE_SERVICE_UNAVAILABLE", "Could not start shake detection", null)
                            return@setMethodCallHandler
                        }
                    } else {
                        stopShakeService()
                    }

                    result.success(null)
                }
                "setNotificationEnabled" -> {
                    val enabled =
                        call.argument<Boolean>("enabled") ?: false

                    FlashAlertPreferences.setNotificationEnabled(
                        this,
                        enabled
                    )

                    result.success(null)
                }
                "setSelectedNotificationApps" -> {

                    val packages =
                        call.argument<List<String>>("packages")
                            ?: emptyList()

                    FlashAlertPreferences.setSelectedNotificationApps(
                        this,
                        packages.toSet()
                    )

                    result.success(null)
                }

                "getSelectedNotificationApps" -> {

                    val packages =
                        FlashAlertPreferences.getSelectedNotificationApps(
                            this
                        )

                    result.success(packages.toList())
                }

                "openNotificationAccessSettings" -> {

                    val intent = Intent(
                        Settings.ACTION_NOTIFICATION_LISTENER_SETTINGS
                    )

                    startActivity(intent)

                    result.success(null)
                }

                // -----------------------------------------------------
                // Check Notification Access
                // -----------------------------------------------------

                "hasNotificationAccess" -> {
                    val enabled =
                        NotificationAccessHelper.isNotificationAccessEnabled(this)
                    result.success(enabled)
                }

//                "isNotificationEnabled" -> {
//                    result.success(
//                        FlashAlertPreferences.isNotificationEnabled(this)
//                    )
//                }

                // -----------------------------------------------------
                // Show Overlay Guide
                // -----------------------------------------------------

                "showOverlayGuide" -> {

                    val intent = Intent(
                        this,
                        OverlayGuideActivity::class.java
                    )

                    startActivity(intent)

                    result.success(null)
                }

                // -----------------------------------------------------
                // Open Overlay Permission Settings
                // -----------------------------------------------------

                "openOverlaySettings" -> {

                    val intent = Intent(
                        Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                        android.net.Uri.parse(
                            "package:$packageName"
                        )
                    )

                    startActivity(intent)

                    result.success(null)
                }

                // -----------------------------------------------------
                // Check Overlay Permission
                // -----------------------------------------------------

                "hasOverlayPermission" -> {

                    val granted =
                        Settings.canDrawOverlays(this)

                    result.success(granted)
                }

                // -----------------------------------------------------
                // Show Real WindowManager Overlay
                // -----------------------------------------------------

                "showOverlayWindow" -> {

                    if (Settings.canDrawOverlays(this)) {

                        val intent = Intent(
                            this,
                            OverlayGuideService::class.java
                        )

                        startService(intent)

                        result.success(null)

                    } else {

                        result.error(
                            "OVERLAY_PERMISSION_DENIED",
                            "Overlay permission is not granted",
                            null
                        )
                    }
                }

                else -> result.notImplemented()
            }
        }
    }

    private fun startShakeService(): Boolean {

        val intent =
            Intent(
                this,
                ShakeService::class.java
            )

        return try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                startForegroundService(intent)
            } else {
                startService(intent)
            }
            true
        } catch (e: Exception) {
            android.util.Log.e("MainActivity", "Could not start ShakeService", e)
            false
        }
    }

    private fun stopShakeService() {

        val intent =
            Intent(
                this,
                ShakeService::class.java
            )

        stopService(intent)
    }

    override fun onResume() {
        super.onResume()
        if (FlashAlertPreferences.isShakeEnabled(this)) {
            startShakeService()
        }
    }

    override fun onDestroy() {
        torchCallback?.let(cameraManager::unregisterTorchCallback)
        torchCallback = null
        super.onDestroy()
    }
}
