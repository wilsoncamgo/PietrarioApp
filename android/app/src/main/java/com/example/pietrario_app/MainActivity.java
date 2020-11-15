package com.example.pietrario_app;

import android.content.Intent;
import android.os.Bundle;
import android.os.PersistableBundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "androidChannel";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        BinaryMessenger messenger = flutterEngine.getDartExecutor().getBinaryMessenger();
        MethodChannel methodChannel = new MethodChannel(messenger, CHANNEL);
        methodChannel.setMethodCallHandler((MethodCall call, MethodChannel.Result result) -> {
            if (call.method.equals("turnAr")) {
                turnAr();
                result.success("success");
            } else {
                result.notImplemented();
            }
        });
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState,
            @Nullable PersistableBundle persistentState) {
        super.onCreate(savedInstanceState, persistentState);

        /*FlutterEngine engine = getFlutterEngine();
        assert engine != null;
        GeneratedPluginRegistrant.registerWith(engine);
        new MethodChannel(engine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler((call, result) -> {
            if(call.method.equals("turnAr")) {
                // turnAr();
                // result.success(String.valueOf(ar));
                result.success("false");
            }
            result.success("no method");
        });*/
    }

    private void turnAr() {
        Intent i = new Intent(MainActivity.this, ArActivity.class);
        startActivity(i);
    }

}
