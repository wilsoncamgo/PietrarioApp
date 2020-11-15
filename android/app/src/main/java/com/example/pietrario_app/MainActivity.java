package com.example.pietrario_app;

import android.content.Intent;
import android.os.Bundle;
import android.os.PersistableBundle;
import androidx.annotation.Nullable;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "androidChannel";
    private static boolean ar = false;

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState,
            @Nullable PersistableBundle persistentState) {
        super.onCreate(savedInstanceState, persistentState);

        FlutterEngine engine = getFlutterEngine();
        assert engine != null;
        GeneratedPluginRegistrant.registerWith(engine);
        new MethodChannel(engine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler((call, result) -> {
            if(call.method.equals("turnAr")) {
                turnAr();
                result.success(String.valueOf(ar));
            }
        });
    }

    private void turnAr() {
        ar = !ar;
        Intent i = new Intent(MainActivity.this, ArActivity.class);
        startActivity(i);
    }

}
