package com.setubandhTech.flashlight

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.provider.Telephony
import android.util.Log

class SmsReceiver : BroadcastReceiver() {

    override fun onReceive(
        context: Context,
        intent: Intent
    ) {
        if (intent.action != Telephony.Sms.Intents.SMS_RECEIVED_ACTION) {
            return
        }

        Log.d(
            "SMS_FLASH",
            "SMS RECEIVED"
        )

        val enabled =
            FlashAlertPreferences.isSmsEnabled(context)

        Log.d(
            "SMS_FLASH",
            "SMS ENABLED = $enabled"
        )

        if (!enabled) {
            return
        }

        Log.d(
            "SMS_FLASH",
            "FLASHING FOR SMS"
        )

        val pendingResult = goAsync()
        FlashlightController.flash(context) {
            try {
                pendingResult.finish()
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }
    }
}