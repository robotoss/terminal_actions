package com.robotoss.qaspda.terminal_actions

import android.app.Activity
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import com.qs.wiget.PrintUtils

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** TerminalActionsPlugin */
class TerminalActionsPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    private lateinit var context: Context
    private lateinit var activity: Activity

    var mIntent = Intent("ismart.intent.scandown")
    private lateinit var scanBroadcastReceiver: ScanBroadcastReceiver

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "terminal_actions")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "init" -> {
                PrintUtils.initPrintUtils(context)
                result.success(true)
            }
            "scan" -> {
                activity.sendBroadcast(mIntent)
                scanBroadcastReceiver = ScanBroadcastReceiver(result, activity)
                val intentFilter = IntentFilter()
                intentFilter.addAction("com.qs.scancode")
                activity.registerReceiver(scanBroadcastReceiver, intentFilter)
            }
            "printText" -> {
                val printText: String = call.argument("textToPrint")!!
                val align: Int = call.argument("textAlign")!!
                /**
                 * Print text
                 * @param size
                 * Text size, where 1 is the normal font, 2-bit double width and height font, does
                 * not support other font sizes
                 * @param align
                 * Alignment mode, where 0 is left, 1 is center, 2 is right
                 * @param text
                 * Text to be printed
                 */
                PrintUtils.printText(1, align, printText)
                result.success(true)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onDetachedFromActivity() {
        TODO("Not yet implemented")
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        TODO("Not yet implemented")
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity;
    }

    override fun onDetachedFromActivityForConfigChanges() {
        TODO("Not yet implemented")
    }

    internal class ScanBroadcastReceiver(
        private val result: Result,
        private val activity: Activity
    ) : BroadcastReceiver() {
        override fun onReceive(context: Context, intent: Intent) {
            val scanData = intent.extras!!.getString("data")
            result.success(scanData)
            // TODO Auto-generated method stub
            activity.unregisterReceiver(this)
        }
    }
}

