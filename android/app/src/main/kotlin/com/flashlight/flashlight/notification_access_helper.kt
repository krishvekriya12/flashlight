package com.flashlight.flashlight

import android.content.ComponentName
import android.content.Context
import android.provider.Settings
import androidx.core.app.NotificationManagerCompat

object NotificationAccessHelper {

    fun isNotificationAccessEnabled(
        context: Context
    ): Boolean {
        try {
            if (NotificationManagerCompat.getEnabledListenerPackages(context).contains(context.packageName)) {
                return true
            }
        } catch (_: Exception) {}

        val enabledListeners =
            Settings.Secure.getString(
                context.contentResolver,
                "enabled_notification_listeners"
            ) ?: return false

        val componentName =
            ComponentName(
                context,
                NotificationListener::class.java
            )

        return enabledListeners
            .split(":")
            .any {
                ComponentName.unflattenFromString(it) == componentName ||
                (it.contains(context.packageName) && it.contains("NotificationListener"))
            }
    }
}


