package com.example.pietrario_app;


import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;


public class ArActivity extends Activity {

    ImageView imgBack;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ar);

        imgBack = findViewById(R.id.ar_back);

        init();
    }

    private void init() {
        listenClick();
    }

    private void listenClick() {
        View.OnClickListener clickListen = v -> {
            if(v == imgBack) {
                Intent i = new Intent(ArActivity.this, MainActivity.class);
                startActivity(i);
            }
        };
        imgBack.setOnClickListener(clickListen);
    }

}
