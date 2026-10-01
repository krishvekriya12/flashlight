package com.flashlight.flashlight

import android.service.notification.NotificationListenerService
import android.service.notification.StatusBarNotification

class NotificationListener : NotificationListenerService() {

    override fun onNotificationPosted(
        sbn: StatusBarNotification
    ) {
        super.onNotificationPosted(sbn)

        val packageName = sbn.packageName

        val notificationEnabled =
            FlashAlertPreferences.isNotificationEnabled(this)

        val selectedApps =
            FlashAlertPreferences.getSelectedNotificationApps(this)

        android.util.Log.d(
            "NOTIFICATION_FLASH",
            "PACKAGE = $packageName"
        )

        android.util.Log.d(
            "NOTIFICATION_FLASH",
            "ENABLED = $notificationEnabled"
        )

        android.util.Log.d(
            "NOTIFICATION_FLASH",
            "SELECTED = $selectedApps"
        )

        if (!notificationEnabled) return

        // Ignore our own notifications
        if (packageName == this.packageName) return

        // Ignore ongoing notifications (e.g. media player, downloads)
        if (sbn.isOngoing) return

        if (!selectedApps.contains(packageName)) return

        android.util.Log.d(
            "NOTIFICATION_FLASH",
            "FLASHING $packageName"
        )

        FlashlightController.flash(this)
    }
}