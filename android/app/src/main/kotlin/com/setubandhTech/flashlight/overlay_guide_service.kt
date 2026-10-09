
package com.setubandhTech.flashlight

import android.app.Service
import android.content.Intent
import android.graphics.PixelFormat
import android.os.Build
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.provider.Settings
import android.view.Gravity
import android.view.LayoutInflater
import android.view.View
import android.view.WindowManager
import android.util.Log
import com.airbnb.lottie.LottieAnimationView

class OverlayGuideService : Service() {

    private lateinit var windowManager: WindowManager
    private var overlayView: View? = null

    private val handler = Handler(Looper.getMainLooper())

    override fun onCreate() {
        super.onCreate()

        if (!Settings.canDrawOverlays(this)) {
            stopSelf()
            return
        }

        windowManager =
            getSystemService(WINDOW_SERVICE) as WindowManager

        val view = LayoutInflater
            .from(this)
            .inflate(
                R.layout.activity_overlay_guide,
                null
            )

        val params = WindowManager.LayoutParams(
            WindowManager.LayoutParams.MATCH_PARENT,
            WindowManager.LayoutParams.WRAP_CONTENT,
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
                WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
            else
                WindowManager.LayoutParams.TYPE_PHONE,
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,
            PixelFormat.TRANSLUCENT
        )

        params.gravity = Gravity.BOTTOM
        params.y = 24

        try {
            windowManager.addView(view, params)
            overlayView = view
        } catch (e: RuntimeException) {
            Log.w("OverlayGuideService", "Could not show overlay", e)
            stopSelf()
            return
        }

        overlayView
            ?.findViewById<LottieAnimationView>(
                R.id.overlayGuideLottie
            )
            ?.playAnimation()

        // Remove the overlay automatically.
        handler.postDelayed(
            {
                stopSelf()
            },
            2700L
        )
    }

    override fun onDestroy() {
        handler.removeCallbacksAndMessages(null)

        overlayView?.let {
            if (::windowManager.isInitialized) {
                windowManager.removeView(it)
            }
        }

        overlayView = null

        super.onDestroy()
    }

    override fun onBind(intent: Intent?): IBinder? {
        return null
    }
}

