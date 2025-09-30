package com.example.qrcode_telpo_ln_reader

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.EventChannel

class QrcodeTelpoLnReaderPlugin: FlutterPlugin, MethodChannel.MethodCallHandler {

    private lateinit var channel: MethodChannel
    private lateinit var eventChannel: EventChannel
    private var hardReaderManager: HardReaderManager? = null

    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, "qrcode_telpo_ln_reader")
        channel.setMethodCallHandler(this)

        eventChannel = EventChannel(binding.binaryMessenger, "qrcode_telpo_ln_reader_event")
        hardReaderManager = HardReaderManager(binding.applicationContext)
        eventChannel.setStreamHandler(hardReaderManager)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "openReader" -> {
                hardReaderManager?.openReader()
                result.success(null)
            }
            "closeReader" -> {
                hardReaderManager?.closeReader()
                result.success(null)
            }
            "startScan" -> {
                hardReaderManager?.startScan()
                result.success(null)
            }
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        eventChannel.setStreamHandler(null)
    }
}
