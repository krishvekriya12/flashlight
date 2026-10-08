package com.flashlight.flashlight

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Intent
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import android.content.pm.ServiceInfo
import android.os.Build
import android.os.IBinder
import kotlin.math.abs

class ShakeService : Service(), SensorEventListener {

    companion object {

        private const val CHANNEL_ID =
            "flash_alert_service"

        private const val NOTIFICATION_ID =
            1001

        // Higher = harder shake required.
        private const val MOVEMENT_THRESHOLD = 7.0

        // Number of back-and-forth movements required.
        private const val REQUIRED_SHAKES = 3

        // Time allowed between shake movements.
        private const val SHAKE_WINDOW = 1200L

        // Prevent flashlight from triggering repeatedly.
        private const val SHAKE_COOLDOWN = 2000L

        private var lastShakeTime = 0L
    }

    private lateinit var sensorManager: SensorManager

    private var accelerometer: Sensor? = null

    private var lastX = 0f
    private var lastY = 0f
    private var lastZ = 0f

    private var lastDirection = 0

    private var shakeCount = 0

    private var firstMovementTime = 0L

    override fun onCreate() {
        super.onCreate()

        createNotificationChannel()

        sensorManager =
            getSystemService(
                SENSOR_SERVICE
            ) as SensorManager

        accelerometer =
            sensorManager.getDefaultSensor(
                Sensor.TYPE_ACCELEROMETER
            )

        if (accelerometer == null) {
            return
        }

        sensorManager.registerListener(
            this,
            accelerometer,
            SensorManager.SENSOR_DELAY_UI
        )
    }

    override fun onStartCommand(
        intent: Intent?,
        flags: Int,
        startId: Int
    ): Int {

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
        } catch (e: RuntimeException) {
            android.util.Log.e("ShakeService", "Could not start foreground service", e)
            stopSelf(startId)
            return START_NOT_STICKY
        }

        if (accelerometer == null || !FlashAlertPreferences.isShakeEnabled(this)) {
            stopSelf(startId)
            return START_NOT_STICKY
        }

        return START_STICKY
    }

    override fun onSensorChanged(
        event: SensorEvent?
    ) {
        if (event == null) {
            return
        }

        if (
            !FlashAlertPreferences.isShakeEnabled(
                this
            )
        ) {
            resetShake()
            return
        }

        val x = event.values[0]
        val y = event.values[1]
        val z = event.values[2]

        // First sensor reading.
        if (
            lastX == 0f &&
            lastY == 0f &&
            lastZ == 0f
        ) {
            lastX = x
            lastY = y
            lastZ = z
            return
        }

        val dx = x - lastX
        val dy = y - lastY
        val dz = z - lastZ

        lastX = x
        lastY = y
        lastZ = z

        // Find the strongest axis movement.
        val movementX = abs(dx)
        val movementY = abs(dy)
        val movementZ = abs(dz)

        val movement: Float
        val direction: Int

        if (
            movementX >= movementY &&
            movementX >= movementZ
        ) {
            movement = movementX
            direction = if (dx > 0) 1 else -1
        } else if (
            movementY >= movementX &&
            movementY >= movementZ
        ) {
            movement = movementY
            direction = if (dy > 0) 1 else -1
        } else {
            movement = movementZ
            direction = if (dz > 0) 1 else -1
        }

        // Ignore small movements.
        if (movement < MOVEMENT_THRESHOLD) {
            return
        }

        val currentTime =
            System.currentTimeMillis()

        // Start a new shake sequence.
        if (shakeCount == 0) {

            shakeCount = 1

            firstMovementTime =
                currentTime

            lastDirection =
                direction

            return
        }

        // Shake sequence took too long.
        if (
            currentTime -
            firstMovementTime >
            SHAKE_WINDOW
        ) {
            resetShake()

            shakeCount = 1

            firstMovementTime =
                currentTime

            lastDirection =
                direction

            return
        }

        // We need movement in the OPPOSITE direction.
        if (
            direction ==
            lastDirection
        ) {
            return
        }

        shakeCount++

        lastDirection =
            direction

        // Not enough back-and-forth movements yet.
        if (
            shakeCount <
            REQUIRED_SHAKES
        ) {
            return
        }

        // Cooldown.
        if (
            currentTime -
            lastShakeTime <
            SHAKE_COOLDOWN
        ) {
            resetShake()
            return
        }

        lastShakeTime =
            currentTime

        resetShake()

        toggleFlashlight()
    }

    private fun resetShake() {

        shakeCount = 0

        firstMovementTime = 0L

        lastDirection = 0
    }

    private fun toggleFlashlight() {

        FlashlightController.toggleFlashlight(this)
    }

    override fun onAccuracyChanged(
        sensor: Sensor?,
        accuracy: Int
    ) {
        // Not required.
    }

    override fun onDestroy() {

        sensorManager.unregisterListener(
            this
        )

        resetShake()

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
                    "Flash Alert",
                    NotificationManager.IMPORTANCE_LOW
                )

            channel.description =
                "Shake detection is active"

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
                .setContentTitle(
                    "Flash Alert is active"
                )
                .setContentText(
                    "Shake detection is enabled"
                )
                .setSmallIcon(
                    android.R.drawable.ic_dialog_info
                )
                .setOngoing(true)
                .build()

        } else {

            Notification.Builder(this)
                .setContentTitle(
                    "Flash Alert is active"
                )
                .setContentText(
                    "Shake detection is enabled"
                )
                .setSmallIcon(
                    android.R.drawable.ic_dialog_info
                )
                .setOngoing(true)
                .build()
        }
    }
}
