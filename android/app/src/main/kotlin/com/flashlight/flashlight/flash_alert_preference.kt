package com.flashlight.flashlight

import android.content.Context

object FlashAlertPreferences {

    private const val PREF_NAME = "flash_alert_preferences"

    private const val KEY_CALL_ENABLED = "call_enabled"
    private const val KEY_SMS_ENABLED = "sms_enabled"
    private const val KEY_SHAKE_ENABLED = "shake_enabled"
    private const val KEY_NOTIFICATION_ENABLED = "notification_enabled"

    private const val KEY_CALL_FLASH_RING = "call_flash_ring"
    private const val KEY_CALL_FLASH_VIBRATE = "call_flash_vibrate"
    private const val KEY_CALL_FLASH_SILENT = "call_flash_silent"

    private const val KEY_SELECTED_NOTIFICATION_APPS =
        "selected_notification_apps"

    private const val KEY_ON_LENGTH = "flash_on_length"
    private const val KEY_OFF_LENGTH = "flash_off_length"

    private fun prefs(context: Context) =
        context.getSharedPreferences(
            PREF_NAME,
            Context.MODE_PRIVATE
        )

    // -------------------------------------------------------------
    // CALL
    // -------------------------------------------------------------

    fun setCallEnabled(
        context: Context,
        enabled: Boolean
    ) {
        prefs(context)
            .edit()
            .putBoolean(
                KEY_CALL_ENABLED,
                enabled
            )
            .apply()
    }

    fun isCallEnabled(
        context: Context
    ): Boolean {
        return prefs(context)
            .getBoolean(
                KEY_CALL_ENABLED,
                false
            )
    }

    // -------------------------------------------------------------
    // CALL FLASH - RING
    // -------------------------------------------------------------

    fun setCallFlashRing(
        context: Context,
        enabled: Boolean
    ) {
        prefs(context)
            .edit()
            .putBoolean(
                KEY_CALL_FLASH_RING,
                enabled
            )
            .apply()
    }

    fun isCallFlashRing(
        context: Context
    ): Boolean {
        return prefs(context)
            .getBoolean(
                KEY_CALL_FLASH_RING,
                true
            )
    }

    // -------------------------------------------------------------
    // CALL FLASH - VIBRATE
    // -------------------------------------------------------------

    fun setCallFlashVibrate(
        context: Context,
        enabled: Boolean
    ) {
        prefs(context)
            .edit()
            .putBoolean(
                KEY_CALL_FLASH_VIBRATE,
                enabled
            )
            .apply()
    }

    fun isCallFlashVibrate(
        context: Context
    ): Boolean {
        return prefs(context)
            .getBoolean(
                KEY_CALL_FLASH_VIBRATE,
                true
            )
    }

    // -------------------------------------------------------------
    // CALL FLASH - SILENT
    // -------------------------------------------------------------

    fun setCallFlashSilent(
        context: Context,
        enabled: Boolean
    ) {
        prefs(context)
            .edit()
            .putBoolean(
                KEY_CALL_FLASH_SILENT,
                enabled
            )
            .apply()
    }

    fun isCallFlashSilent(
        context: Context
    ): Boolean {
        return prefs(context)
            .getBoolean(
                KEY_CALL_FLASH_SILENT,
                true
            )
    }

    // -------------------------------------------------------------
    // SMS
    // -------------------------------------------------------------

    fun setSmsEnabled(
        context: Context,
        enabled: Boolean
    ) {
        prefs(context)
            .edit()
            .putBoolean(
                KEY_SMS_ENABLED,
                enabled
            )
            .apply()
    }

    fun isSmsEnabled(
        context: Context
    ): Boolean {
        return prefs(context)
            .getBoolean(
                KEY_SMS_ENABLED,
                false
            )
    }

    // -------------------------------------------------------------
    // SHAKE
    // -------------------------------------------------------------

    fun setShakeEnabled(
        context: Context,
        enabled: Boolean
    ) {
        prefs(context)
            .edit()
            .putBoolean(
                KEY_SHAKE_ENABLED,
                enabled
            )
            .apply()
    }

    fun isShakeEnabled(
        context: Context
    ): Boolean {
        return prefs(context)
            .getBoolean(
                KEY_SHAKE_ENABLED,
                false
            )
    }

    // -------------------------------------------------------------
    // NOTIFICATIONS
    // -------------------------------------------------------------

    fun setNotificationEnabled(
        context: Context,
        enabled: Boolean
    ) {
        prefs(context)
            .edit()
            .putBoolean(
                KEY_NOTIFICATION_ENABLED,
                enabled
            )
            .apply()
    }

    fun isNotificationEnabled(
        context: Context
    ): Boolean {
        return prefs(context)
            .getBoolean(
                KEY_NOTIFICATION_ENABLED,
                false
            )
    }

    // -------------------------------------------------------------
    // SELECTED NOTIFICATION APPS
    // -------------------------------------------------------------

    fun setSelectedNotificationApps(
        context: Context,
        packages: Set<String>
    ) {
        prefs(context)
            .edit()
            .putStringSet(
                KEY_SELECTED_NOTIFICATION_APPS,
                packages
            )
            .apply()
    }

    fun getSelectedNotificationApps(
        context: Context
    ): Set<String> {
        return prefs(context)
            .getStringSet(
                KEY_SELECTED_NOTIFICATION_APPS,
                emptySet()
            )
            ?.toSet()
            ?: emptySet()
    }

    // -------------------------------------------------------------
    // FLASH ON/OFF LENGTH
    // -------------------------------------------------------------

    fun setOnLength(
        context: Context,
        length: Long
    ) {
        prefs(context)
            .edit()
            .putLong(
                KEY_ON_LENGTH,
                length
            )
            .apply()
    }

    fun getOnLength(
        context: Context
    ): Long {
        return prefs(context)
            .getLong(
                KEY_ON_LENGTH,
                300L
            )
    }

    fun setOffLength(
        context: Context,
        length: Long
    ) {
        prefs(context)
            .edit()
            .putLong(
                KEY_OFF_LENGTH,
                length
            )
            .apply()
    }

    fun getOffLength(
        context: Context
    ): Long {
        return prefs(context)
            .getLong(
                KEY_OFF_LENGTH,
                300L
            )
    }
}