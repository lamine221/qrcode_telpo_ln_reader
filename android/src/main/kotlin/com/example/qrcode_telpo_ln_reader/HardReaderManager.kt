package com.example.qrcode_telpo_ln_reader

import android.content.Context
import android.os.Handler
import android.os.Looper
import android.util.Log
import com.common.apiutil.CommonException
import com.common.apiutil.decode.HardReader
import com.common.callback.IDecodeReaderListener
import io.flutter.plugin.common.EventChannel

class HardReaderManager(private val context: Context) : EventChannel.StreamHandler {

    private var hardReader: HardReader? = null
    private var eventSink: EventChannel.EventSink? = null
    private val handler = Handler(Looper.getMainLooper())
    private var scanCount = 0

    fun openReader() {
        if (hardReader == null) {
            hardReader = HardReader(context)
            hardReader?.setHardReaderListener(object : IDecodeReaderListener {
                override fun onRecvData(data: ByteArray?) {
                    data?.let {
                        val str = String(it, charset("GB2312"))
                        scanCount++
                        handler.post {
                            eventSink?.success(str)
                        }
                    }
                }
            })
        }

        try {
            hardReader?.open(115200)
        } catch (e: CommonException) {
            Log.e("HardReaderManager", "Erreur openReader: ${e.message}")
        }
    }

    fun closeReader() {
        try {
            hardReader?.close()
        } catch (e: CommonException) {
            Log.e("HardReaderManager", "Erreur closeReader: ${e.message}")
        }
    }

    fun startScan() {
        // Pour certains modèles, on peut lancer un scan matériel
        try {
            hardReader?.startDecode() // méthode selon SDK Telpo
        } catch (e: CommonException) {
            Log.e("HardReaderManager", "Erreur startScan: ${e.message}")
        }
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
    }
}
