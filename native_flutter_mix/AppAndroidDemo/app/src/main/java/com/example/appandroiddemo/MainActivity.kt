package com.example.appandroiddemo

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.view.FlutterView

/**
 * https://flutter.dev/docs/development/add-to-app/android/add-flutter-screen?tab=custom-activity-launch-kotlin-tab
 */
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
//        setContentView(R.layout.activity_main)

        startActivity(
            FlutterActivity.createDefaultIntent(this)
        );

        /**
         * Flutter hot reload 调试
        1、列出设备
        ➜  my_flutter flutter devices
        2 connected devices:

        MuMu                • emulator-5554                            • android-x86 • Android 6.0.1 (API 23)
        “karos li”的 iPhone  • 0433a9c011d6173f9e7048aa398afa7d95c1212c • ios         • iOS 12.4
        2、附加设备上
        ➜  my_flutter flutter attach -d emulator-5554
        Waiting for a connection from Flutter on MuMu...
        Syncing files to device MuMu...
        9,616ms (!)

        Flutter run key commands.
        r Hot reload. 🔥🔥🔥
        R Hot restart.
        h Repeat this help message.
        d Detach (terminate "flutter run" but leave application running).
        c Clear the screen
        q Quit (terminate the application on the device).
        An Observatory debugger and profiler on MuMu is available at: http://127.0.0.1:58690/iwVxGaapTQU=/
         */
    }
}