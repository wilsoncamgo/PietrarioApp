package com.example.pietrario_app;


import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;

import androidx.appcompat.app.AppCompatActivity;

import com.google.ar.sceneform.Camera;
import com.google.ar.sceneform.Node;
import com.google.ar.sceneform.Scene;
import com.google.ar.sceneform.math.Vector3;
import com.google.ar.sceneform.rendering.ModelRenderable;
import com.google.ar.sceneform.ux.ArFragment;

public class ArActivity extends AppCompatActivity {

    private ImageView imgBack;

    private String uriPietrario;
    private ModelRenderable modelRenderable;

    private ArFragment fragAr;
    private Scene scene;
    private Camera camera;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ar);

        imgBack = findViewById(R.id.ar_back);

        init();
    }

    private void init() {
        listenClick();
        initAr();
        initModels();
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

    private void initAr() {
        fragAr = (ArFragment) getSupportFragmentManager().findFragmentById(R.id.frag_ar);
        assert fragAr != null;
        scene = fragAr.getArSceneView().getScene();
        camera = scene.getCamera();
    }

    private void initModels() {
        uriPietrario = "wolves.sfb";
        ModelRenderable.builder().setSource(this, Uri.parse(uriPietrario)).build()
                .thenAccept(renderable -> {
            Node node = new Node();
            node.setRenderable(renderable);
            scene.addChild(node);
            node.setWorldPosition(new Vector3(0, 0, 0));
        });
    }

}
