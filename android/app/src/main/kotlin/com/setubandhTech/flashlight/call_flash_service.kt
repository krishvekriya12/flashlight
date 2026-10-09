package com.setubandhTech.flashlight

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Intent
import android.content.pm.ServiceInfo
import android.os.Build
import android.os.Handler
import android.os.IBinder
import android.os.Looper

class CallFlashService : Service() {

    companion object {
        private const val CHANNEL_ID = "call_flash_service"
        private const val NOTIFICATION_ID = 2001

        const val ACTION_START = "START_CALL_FLASH"
        const val ACTION_STOP = "STOP_CALL_FLASH"
    }

    private val handler = Handler(Looper.getMainLooper())

    private var flashlightOn = false
    private var isFlashing = false
    private var foregroundStarted = false

    private val flashRunnable =
        object : Runnable {
            override fun run() {

                if (!isFlashing) {
                    return
                }

                flashlightOn = !flashlightOn

                FlashlightController.setFlashlight(
                    this@CallFlashService,
                    flashlightOn
                )

                val delay = if (flashlightOn) {
                    FlashAlertPreferences.getOnLength(this@CallFlashService)
                } else {
                    FlashAlertPreferences.getOffLength(this@CallFlashService)
                }

                handler.postDelayed(
                    this,
                    delay
                )
            }
        }

    override fun onCreate() {
        super.onCreate()

        createNotificationChannel()

        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
                startForeground(
                    NOTIFICATION_ID,
                    createNotification(),
                    ServiceInfo.FOREGROUND_SERVICE_TYPE_SPECIAL_USE
                )
            } else {
                startForeground(NOTIFICATION_ID, createNotification())
            }
            foregroundStarted = true
        } catch (e: RuntimeException) {
            android.util.Log.e("CallFlashService", "Could not start foreground service", e)
            stopSelf()
        }
    }

    override fun onStartCommand(
        intent: Intent?,
        flags: Int,
        startId: Int
    ): Int {

        if (!foregroundStarted) {
            stopSelf(startId)
            return START_NOT_STICKY
        }

        when (intent?.action) {

            ACTION_START -> {
                startFlashing()
            }

            ACTION_STOP -> {
                stopFlashing()
                stopSelf()
            }
        }

        return START_NOT_STICKY
    }

    private fun startFlashing() {

        if (isFlashing) {
            return
        }

        isFlashing = true
        flashlightOn = false

        handler.removeCallbacks(
            flashRunnable
        )

        FlashlightController.setFlashlight(
            this,
            false
        )

        handler.post(
            flashRunnable
        )
    }

    private fun stopFlashing() {

        isFlashing = false

        handler.removeCallbacks(
            flashRunnable
        )

        flashlightOn = false

        FlashlightController.setFlashlight(
            this,
            false
        )
    }

    override fun onDestroy() {

        stopFlashing()

        super.onDestroy()
    }

    override fun onBind(
        intent: Intent?
    ): IBinder? {
        return null
    }

    private fun createNotificationChannel() {

        if (
            Build.VERSION.SDK_INT >=
            Build.VERSION_CODES.O
        ) {

            val channel =
                NotificationChannel(
                    CHANNEL_ID,
                    "Call Flash",
                    NotificationManager.IMPORTANCE_LOW
                )

            val manager =
                getSystemService(
                    NotificationManager::class.java
                )

            manager.createNotificationChannel(
                channel
            )
        }
    }

    private fun createNotification(): Notification {

        return if (
            Build.VERSION.SDK_INT >=
            Build.VERSION_CODES.O
        ) {

            Notification.Builder(
                this,
                CHANNEL_ID
            )
                .setContentTitle("Call Flash")
                .setContentText(
                    "Flashlight is flashing for incoming call"
                )
                .setSmallIcon(
                    android.R.drawable.ic_dialog_info
                )
                .setOngoing(true)
                .build()

        } else {

            Notification.Builder(this)
                .setContentTitle("Call Flash")
                .setContentText(
                    "Flashlight is flashing for incoming call"
                )
                .setSmallIcon(
                    android.R.drawable.ic_dialog_info
                )
                .setOngoing(true)
                .build()
        }
    }
}
