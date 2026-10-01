package com.flashlight.flashlight

import android.app.Activity
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.view.View
import android.view.Window
import android.view.animation.AccelerateDecelerateInterpolator
import com.airbnb.lottie.LottieAnimationView

class OverlayGuideActivity : Activity() {

    private val handler = Handler(Looper.getMainLooper())
    private var dismissed = false
    private var card: View? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Make Activity window transparent.
        window.setBackgroundDrawableResource(
            android.R.color.transparent
        )

        setContentView(R.layout.activity_overlay_guide)

        card = findViewById(R.id.overlayGuideCard)

        findViewById<LottieAnimationView>(
            R.id.overlayGuideLottie
        ).playAnimation()

        findViewById<View>(
            R.id.overlayGuideRoot
        ).setOnClickListener {
            dismiss()
        }

        handler.postDelayed({
            dismiss()
        }, 2600L)
    }

    override fun onDestroy() {
        handler.removeCallbacksAndMessages(null)
        card?.animate()?.cancel()
        super.onDestroy()
    }

    private fun dismiss() {
        if (dismissed) return

        dismissed = true
        handler.removeCallbacksAndMessages(null)

        val cardView = card

        if (cardView == null) {
            finish()
            return
        }

        cardView.animate()
            .translationY(cardView.height.toFloat())
            .setDuration(500L)
            .setInterpolator(
                AccelerateDecelerateInterpolator()
            )
            .withEndAction {
                finish()
            }
            .start()
    }
}