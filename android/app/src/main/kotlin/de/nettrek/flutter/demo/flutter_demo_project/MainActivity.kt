package de.nettrek.flutter.demo.flutter_demo_project

import androidx.annotation.NonNull
import androidx.annotation.UiThread
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Bundle
import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import io.flutter.plugin.common.MethodCall


class MainActivity: FlutterActivity() {
    private val CHANNEL = "de.nettrek.flutter.demo.demo_flutter_project/battery";

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        //Native way
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler(
            MyMethodCallHandler(context)
        );

        //Pigeon
        Pigeon.BatteryApi.setup(flutterEngine.dartExecutor.binaryMessenger, BatteryApiImpl(context));
    }
}

class BatteryApiImpl(context: Context) : Pigeon.BatteryApi {
    private final val CONTEXT = context;

    override fun getBatteryLevel(): Long {
        return MyMethodCallHandler.getBatteryLevel(CONTEXT).toLong()
    }
}

class MyMethodCallHandler(context: Context) : MethodChannel.MethodCallHandler {
    private final val CONTEXT = context;

    @UiThread
    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        when (call.method) {
            "getBatteryLevel" -> processBateryLevel(result);
            else -> result.notImplemented();
        }
    }

    private fun processBateryLevel(result: MethodChannel.Result) {
        val batteryLevel = getBatteryLevel(CONTEXT);

        if (batteryLevel != -1) {
            result.success(batteryLevel);
        } else {
            result.error("UNAVAILABLE", "Battery level not available.", null);
        }
    }

    companion object {
        fun getBatteryLevel(context: Context): Int {
            val batteryLevel: Int
            if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP)
            {
                val batteryManager = context.getSystemService(Context.BATTERY_SERVICE) as BatteryManager
                batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
            } else
            {
                val intent = ContextWrapper(context).registerReceiver(
                    null,
                    IntentFilter(Intent.ACTION_BATTERY_CHANGED)
                )
                batteryLevel =
                    intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(
                        BatteryManager.EXTRA_SCALE,
                        -1
                    )
            }
            return batteryLevel
        }
    }
}
