package com.flashlight.flashlight

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
                    FlashlightController.setFlashlight(
                        this,
                        true
                    )

                    result.success(null)
                }

                "turnOff" -> {
                    FlashlightController.setFlashlight(
                        this,
                        false
                    )

                    result.success(null)
                }

                else -> {
                    result.notImplemented()
                }
            }
        }

        // -------------------------------------------------------------
        // Listen for real flashlight state changes
        // -------------------------------------------------------------

        cameraManager.registerTorchCallback(
            object : CameraManager.TorchCallback() {

                override fun onTorchModeChanged(
                    cameraId: String,
                    enabled: Boolean
                ) {
                    super.onTorchModeChanged(
                        cameraId,
                        enabled
                    )

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
            },
            null
        )

        // -------------------------------------------------------------
        // Settings
        // -------------------------------------------------------------

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            SETTINGS_CHANNEL
        ).setMethodCallHandler { call, result ->

            when (call.method) {

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

// -----------------------------------------------------
// Call Flash Mode
// -----------------------------------------------------

                // -----------------------------------------------------
// Call Flash Mode
// -----------------------------------------------------

//                "setCallFlashMode" -> {
//
//                    val mode =
//                        call.argument<String>("mode")
//
//                    val enabled =
//                        call.argument<Boolean>("enabled") ?: false
//
//                    when (mode) {
//
//                        "ring" -> {
//                            FlashAlertPreferences.setCallFlashRing(
//                                this,
//                                enabled
//                            )
//                        }
//
//                        "vibrate" -> {
//                            FlashAlertPreferences.setCallFlashVibrate(
//                                this,
//                                enabled
//                            )
//                        }
//
//                        "silent" -> {
//                            FlashAlertPreferences.setCallFlashSilent(
//                                this,
//                                enabled
//                            )
//                        }
//                    }
//
//                    result.success(null)
//                }


                "setShakeEnabled" -> {

                    val enabled =
                        call.argument<Boolean>("enabled") ?: false

                    FlashAlertPreferences.setShakeEnabled(
                        this,
                        enabled
                    )

                    if (enabled) {
                        startShakeService()
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

                    android.util.Log.d(
                        "NOTIFICATION_FLASH",
                        "SET ENABLED = $enabled"
                    )

                    android.util.Log.d(
                        "NOTIFICATION_FLASH",
                        "STORED ENABLED = ${
                            FlashAlertPreferences.isNotificationEnabled(this)
                        }"
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
            }
        }
    }

    private fun startShakeService() {

        val intent =
            Intent(
                this,
                ShakeService::class.java
            )

        if (
            Build.VERSION.SDK_INT >=
            Build.VERSION_CODES.O
        ) {
            startForegroundService(intent)
        } else {
            startService(intent)
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
}