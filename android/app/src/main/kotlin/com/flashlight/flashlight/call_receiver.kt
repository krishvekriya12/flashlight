package com.flashlight.flashlight

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.media.AudioManager
import android.os.Build
import android.telephony.TelephonyManager

class CallReceiver : BroadcastReceiver() {

    override fun onReceive(
        context: Context,
        intent: Intent
    ) {

        if (
            intent.action !=
            TelephonyManager.ACTION_PHONE_STATE_CHANGED
        ) {
            return
        }

        val state =
            intent.getStringExtra(
                TelephonyManager.EXTRA_STATE
            ) ?: return

        when (state) {

            TelephonyManager.EXTRA_STATE_RINGING -> {

                if (
                    !FlashAlertPreferences
                        .isCallEnabled(context)
                ) {
                    return
                }

                val audioManager =
                    context.getSystemService(
                        Context.AUDIO_SERVICE
                    ) as AudioManager

                val shouldFlash =
                    when (audioManager.ringerMode) {

                        AudioManager.RINGER_MODE_NORMAL ->
                            FlashAlertPreferences
                                .isCallFlashRing(context)

                        AudioManager.RINGER_MODE_VIBRATE ->
                            FlashAlertPreferences
                                .isCallFlashVibrate(context)

                        AudioManager.RINGER_MODE_SILENT ->
                            FlashAlertPreferences
                                .isCallFlashSilent(context)

                        else -> false
                    }

                if (!shouldFlash) {
                    return
                }

                val serviceIntent =
                    Intent(
                        context,
                        CallFlashService::class.java
                    ).apply {
                        action =
                            CallFlashService.ACTION_START
                    }

                try {
                    if (
                        Build.VERSION.SDK_INT >=
                        Build.VERSION_CODES.O
                    ) {
                        context.startForegroundService(
                            serviceIntent
                        )
                    } else {
                        context.startService(
                            serviceIntent
                        )
                    }
                } catch (e: Exception) {
                    android.util.Log.e("CallReceiver", "Could not start CallFlashService, falling back to direct flash: ${e.message}")
                    FlashlightController.startCallFlash(context)
                }
            }

            TelephonyManager.EXTRA_STATE_OFFHOOK,
            TelephonyManager.EXTRA_STATE_IDLE -> {

                try {
                    val serviceIntent =
                        Intent(
                            context,
                            CallFlashService::class.java
                        ).apply {
                            action =
                                CallFlashService.ACTION_STOP
                        }

                    context.startService(serviceIntent)
                } catch (e: Exception) {
                    android.util.Log.e("CallReceiver", "Could not stop CallFlashService: ${e.message}")
                }

                FlashlightController.stopCallFlash(context)
            }
        }
    }
}