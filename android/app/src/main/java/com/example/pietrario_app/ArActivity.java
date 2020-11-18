package com.example.pietrario_app;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;

import androidx.appcompat.app.AppCompatActivity;

import com.google.ar.core.Anchor;
import com.google.ar.core.HitResult;
import com.google.ar.sceneform.AnchorNode;
import com.google.ar.sceneform.Camera;
import com.google.ar.sceneform.Scene;
import com.google.ar.sceneform.math.Quaternion;
import com.google.ar.sceneform.math.Vector3;
import com.google.ar.sceneform.rendering.ModelRenderable;
import com.google.ar.sceneform.ux.ArFragment;
import com.google.ar.sceneform.ux.TransformableNode;

import java.util.HashMap;
import java.util.function.Consumer;

public class ArActivity extends AppCompatActivity {

    private ImageView imgBack;
    private ArFragment fragAr;
    private Scene scene;
    private Camera camera;

    private ModelRenderable modelPietrario;
    private ModelRenderable[] modelGuardians;
    private ModelRenderable[] modelSucculents;

    private Vector3 scalePietrario;
    private Vector3[] scaleGuardians;
    private Vector3[] scaleSucculents;

    private Quaternion rotationPietrario;
    private Quaternion rotationGuardian;
    private Quaternion[] rotationSucculents;

    private Vector3 posPietrario;
    private Vector3 posGuardian;
    private Vector3[] posSucculents;

    private AnchorNode nodePietrario;
    private AnchorNode nodeGuardian;
    private AnchorNode[] nodeSucculents;

    private HashMap<Integer, Integer> succulents;
    private int guardian;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ar);

        imgBack = findViewById(R.id.ar_back);

        init();
    }

    private void init() {
        listenClick();
        initSucculents();
        initAr();
        initModels();
        initVectors();
        setUpPlane();
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

    private void initSucculents() {
        // key = position [0, 9]
        // value = succulent [0, 2]
        guardian = 0;
        succulents = new HashMap<>();
        succulents.put(0, 0);
    }

    private void initAr() {
        fragAr = (ArFragment) getSupportFragmentManager().findFragmentById(R.id.frag_ar);
        assert fragAr != null;
        scene = fragAr.getArSceneView().getScene();
        camera = scene.getCamera();
    }

    private void initModels() {
        buildModel(R.raw.pietrario, renderable -> modelPietrario = renderable);
        modelGuardians = new ModelRenderable[2];
        buildModel(R.raw.guardian1, renderable -> modelGuardians[0] = renderable);
        buildModel(R.raw.guardian2, renderable -> modelGuardians[1] = renderable);
        modelSucculents = new ModelRenderable[3];
        buildModel(R.raw.succulent1, renderable -> modelSucculents[0] = renderable);
        buildModel(R.raw.succulent2, renderable -> modelSucculents[1] = renderable);
        buildModel(R.raw.succulent3, renderable -> modelSucculents[2] = renderable);
    }

    private void initVectors() {
        // scale
        scalePietrario = new Vector3(0.9f, 0.9f, 0.9f);
        scaleGuardians = new Vector3[]{
                new Vector3(0.3f, 0.3f, 0.3f),
                new Vector3(0.3f, 0.3f, 0.3f),
        };
        scaleSucculents = new Vector3[]{
                new Vector3(0.3f, 0.3f, 0.3f),
                new Vector3(0.3f, 0.3f, 0.3f),
                new Vector3(0.3f, 0.3f, 0.3f),
        };
        // rotation
        rotationPietrario = new Quaternion();
        rotationGuardian = new Quaternion();
        rotationSucculents = new Quaternion[]{
                new Quaternion(),
                new Quaternion(),
                new Quaternion(),
                new Quaternion(),
                new Quaternion(),
                new Quaternion(),
                new Quaternion(),
                new Quaternion(),
                new Quaternion(),
                new Quaternion(),
        };
        // position
        posPietrario = new Vector3();
        posGuardian = new Vector3(0.3f, 0.3f, 0.3f);
        posSucculents = new Vector3[]{
                new Vector3(0.3f, 0.3f, 0.3f),
                new Vector3(0.3f, 0.3f, 0.3f),
                new Vector3(0.3f, 0.3f, 0.3f),
                new Vector3(0.3f, 0.3f, 0.3f),
                new Vector3(0.3f, 0.3f, 0.3f),
                new Vector3(0.3f, 0.3f, 0.3f),
                new Vector3(0.3f, 0.3f, 0.3f),
                new Vector3(0.3f, 0.3f, 0.3f),
                new Vector3(0.3f, 0.3f, 0.3f),
                new Vector3(0.3f, 0.3f, 0.3f),
        };
    }

    private void setUpPlane() {
        fragAr.setOnTapArPlaneListener((hitResult, plane, motionEvent) -> {
            // remove old
            if(nodePietrario != null) scene.removeChild(nodePietrario);
            if(nodeGuardian != null) scene.removeChild(nodeGuardian);
            if(nodeSucculents != null) {
                for(int i = nodeSucculents.length - 1; i >= 0; i--) {
                    if(nodeSucculents[i] != null) scene.removeChild(nodeSucculents[i]);
                }
            }
            // add new
            nodePietrario = buildNode(hitResult, modelPietrario,
                    posPietrario, scalePietrario, rotationPietrario);
            if(guardian != -1) {
                nodeGuardian = buildNode(hitResult, modelGuardians[guardian],
                        posGuardian, scaleGuardians[guardian], rotationGuardian);
            }
            nodeSucculents = new AnchorNode[10];
            succulents.forEach((k, v) -> {
                // key = position [0, 9]
                // value = succulent [0, 2]
                nodeSucculents[k] = buildNode(hitResult, modelSucculents[v],
                        posSucculents[k], scaleSucculents[v], rotationSucculents[k]);
            });
        });
    }

    private void buildModel(int modelUri, Consumer<? super ModelRenderable> action) {
        ModelRenderable.builder().setSource(ArActivity.this, modelUri).build()
                .thenAccept(action)
                .exceptionally(throwable -> {
                    Log.d("armsg", "Model can't be loaded");
                    return null;
                });
    }

    private AnchorNode buildNode(HitResult hitResult, ModelRenderable model,
            Vector3 position, Vector3 scale, Quaternion rotation) {
        Anchor anchor = hitResult.createAnchor();
        AnchorNode node = new AnchorNode(anchor);
        scene.addChild(node);
        node.setLocalPosition(position);
        node.setLocalScale(scale);
        node.setLocalRotation(rotation);
        TransformableNode tNode = new TransformableNode(fragAr.getTransformationSystem());
        node.addChild(tNode);
        tNode.setRenderable(model);
        tNode.select();
        return node;
    }

}
