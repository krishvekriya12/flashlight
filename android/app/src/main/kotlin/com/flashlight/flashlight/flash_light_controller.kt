package com.flashlight.flashlight

import android.content.Context
import android.hardware.camera2.CameraCharacteristics
import android.hardware.camera2.CameraManager
import android.os.Handler
import android.os.Looper

object FlashlightController {

    private var cameraId: String? = null
    private var torchOn = false
    private var torchCommandVersion = 0L
    private var pendingFlashes = 0
    private var restoreTorchOn = false
    private var flashCommandVersion = 0L

    private val handler = Handler(Looper.getMainLooper())

    private var callFlashRunnable: Runnable? = null
    private var callFlashRunning = false
    private var callFlashState = false

    // =========================================================
    // CAMERA ID
    // =========================================================

    private fun getCameraId(context: Context): String? {

        if (cameraId != null) {
            return cameraId
        }

        try {

            val cameraManager =
                context.getSystemService(Context.CAMERA_SERVICE)
                        as CameraManager

            // Prefer rear camera.
            for (id in cameraManager.cameraIdList) {

                val characteristics =
                    cameraManager.getCameraCharacteristics(id)

                val hasFlash =
                    characteristics.get(
                        CameraCharacteristics.FLASH_INFO_AVAILABLE
                    ) == true

                val lensFacing =
                    characteristics.get(
                        CameraCharacteristics.LENS_FACING
                    )

                if (
                    hasFlash &&
                    lensFacing ==
                    CameraCharacteristics.LENS_FACING_BACK
                ) {
                    cameraId = id
                    return id
                }
            }

            // Fallback to any camera with flash.
            for (id in cameraManager.cameraIdList) {

                val characteristics =
                    cameraManager.getCameraCharacteristics(id)

                val hasFlash =
                    characteristics.get(
                        CameraCharacteristics.FLASH_INFO_AVAILABLE
                    ) == true

                if (hasFlash) {
                    cameraId = id
                    return id
                }
            }

        } catch (e: Exception) {
            e.printStackTrace()
        }

        return null
    }

    // =========================================================
    // BASIC FLASHLIGHT
    // =========================================================

    @Synchronized
    fun setFlashlight(
        context: Context,
        enabled: Boolean
    ): Boolean {
        torchCommandVersion++
        return setTorchMode(context, enabled)
    }

    private fun setTorchMode(context: Context, enabled: Boolean): Boolean {
        try {

            val cameraManager =
                context.getSystemService(Context.CAMERA_SERVICE)
                        as CameraManager

            val id = getCameraId(context)

            if (id == null) {
                return false
            }

            cameraManager.setTorchMode(
                id,
                enabled
            )
            torchOn = enabled
            return true

        } catch (e: Exception) {
            e.printStackTrace()
            return false
        }
    }

    @Synchronized
    fun onTorchModeChanged(context: Context, changedCameraId: String, enabled: Boolean): Boolean {
        if (changedCameraId != getCameraId(context)) return false
        if (torchOn != enabled) {
            torchOn = enabled
            torchCommandVersion++
        }
        return true
    }

    // =========================================================
    // NORMAL ONE-TIME FLASH
    // =========================================================

    fun flash(
        context: Context,
        duration: Long? = null,
        onComplete: (() -> Unit)? = null
    ) {
        val delay = duration ?: FlashAlertPreferences.getOnLength(context)
        handler.post {
            synchronized(this) {
                if (pendingFlashes == 0) {
                    restoreTorchOn = torchOn
                    flashCommandVersion = torchCommandVersion
                }
                pendingFlashes++
                setTorchMode(context, true)
            }

            handler.postDelayed({
                synchronized(this) {
                    pendingFlashes--
                    if (pendingFlashes == 0 && flashCommandVersion == torchCommandVersion) {
                        setTorchMode(context, restoreTorchOn)
                    }
                }
                onComplete?.invoke()
            }, delay)
        }
    }

    // =========================================================
    // START CALL FLASH
    // =========================================================

    fun startCallFlash(context: Context) {

        // Already flashing.
        if (callFlashRunning) {
            return
        }

        callFlashRunning = true
        callFlashState = false

        val runnable = object : Runnable {

            override fun run() {

                // Call already ended.
                if (!callFlashRunning) {
                    return
                }

                // Toggle flashlight.
                callFlashState = !callFlashState

                setFlashlight(
                    context,
                    callFlashState
                )

                // Continue until stopCallFlash() is called.
                val delay = if (callFlashState) {
                    FlashAlertPreferences.getOnLength(context)
                } else {
                    FlashAlertPreferences.getOffLength(context)
                }

                handler.postDelayed(
                    this,
                    delay
                )
            }
        }

        callFlashRunnable = runnable

        // Start immediately.
        handler.post(runnable)
    }

    // =========================================================
    // STOP CALL FLASH
    // =========================================================

    fun stopCallFlash(context: Context) {

        callFlashRunning = false

        callFlashRunnable?.let { runnable ->
            handler.removeCallbacks(runnable)
        }

        callFlashRunnable = null

        callFlashState = false

        // Make absolutely sure torch is OFF.
        setFlashlight(
            context,
            false
        )
    }

    // =========================================================
    // SAFETY STOP
    // =========================================================

    fun isCallFlashRunning(): Boolean {
        return callFlashRunning
    }
}
