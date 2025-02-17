package com.example.crafty_bay

import android.os.Bundle
import androidx.core.view.WindowCompat
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Enable Edge-to-Edge layout
        WindowCompat.setDecorFitsSystemWindows(window, false)
    }
}

