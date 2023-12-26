package com.example.app


import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.shamma.sample/app"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "encrypt" -> {
                    val input = call.argument<String>("input")
                    val key = call.argument<String>("key")
                    val iv = call.argument<String>("iv")
                    // Call Rust encrypt function
                    val encrypted = Cryptor.encrypt(input!!, key!!, iv!!)
                    result.success(encrypted)
                }
                "decrypt" -> {
                    val input = call.argument<String>("input")
                    val key = call.argument<String>("key")
                    val iv = call.argument<String>("iv")
                    // Call Rust decrypt function
                    val decrypted = Cryptor.decrypt(input!!, key!!, iv!!)
                    result.success(decrypted)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}
