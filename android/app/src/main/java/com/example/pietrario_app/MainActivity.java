package com.example.pietrario_app;

import android.content.Intent;
import android.os.Bundle;
import android.os.PersistableBundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.Map;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "androidChannel";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        BinaryMessenger messenger = flutterEngine.getDartExecutor().getBinaryMessenger();
        MethodChannel methodChannel = new MethodChannel(messenger, CHANNEL);
        methodChannel.setMethodCallHandler((MethodCall call, MethodChannel.Result result) -> {
            if (call.method.equals("turnAr")) {
                turnAr(call);
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
    }

    private void turnAr(MethodCall call) {
        Map<String, Object> params = (Map<String, Object>) call.arguments;
        ArActivity.guardian = guardianToIndex((String) params.get("guardian"));
        ArActivity.succulents.clear();
        for(int i = 7; i >= 0; i--) {
            int s = succulentToIndex((String) params.get("place" + i));
            if(s != -1) ArActivity.succulents.put(i, s);
        }
        Intent i = new Intent(MainActivity.this, ArActivity.class);
        startActivity(i);
    }


    private int guardianToIndex(String name) {
        if(name.equals("none")) return -1;
        if(name.equals("wolf")) return 0;
        if(name.equals("deer")) return 1;
        return -2;
    }

    private int succulentToIndex(String name) {
        if(name.equals("none")) return -1;
        if(name.equals("succulent1")) return 0;
        if(name.equals("succulent2")) return 1;
        if(name.equals("succulent3")) return 2;
        return -2;
    }

}
