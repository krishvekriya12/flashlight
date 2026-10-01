package com.flashlight.flashlight

import android.content.ComponentName
import android.content.Context
import android.provider.Settings

object NotificationAccessHelper {

    fun isNotificationAccessEnabled(
        context: Context
    ): Boolean {

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
                ComponentName.unflattenFromString(it) ==
                        componentName
            }
    }
}


