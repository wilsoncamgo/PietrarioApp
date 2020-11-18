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
                finish();
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
        rotationGuardian = new Quaternion(90, 0, 0, 1);
        rotationSucculents = new Quaternion[]{
                new Quaternion(92.9f, -2.03f, -3.98f, 1),
                new Quaternion(85.5f, 2.98f, -63.1f, 1),
                new Quaternion(89.9f, 2.56f, -3.88f, 1),
                new Quaternion(85.6f, -2.73f, 75.8f, 1),
                new Quaternion(81.5f, -2.82f, -37.1f, 1),
                new Quaternion(80.0f, -6.61f, 0.746f, 1),
                new Quaternion(78.4f, -8.1f, -2.94f, 1),
                new Quaternion(87.6f, -2.67f, 39.3f, 1),
        };
        // position
        posPietrario = new Vector3(0, 0, 0);
        posGuardian = new Vector3(0.13144f, 0.091951f, 0.000238f);
        posSucculents = new Vector3[]{
                new Vector3(-1.0475f, 0.69443f, 0.90855f),
                new Vector3(-0.21225f, 0.049081f, 0.063879f),
                new Vector3(-0.51632f, 0.60319f, 0.42301f),
                new Vector3(-1.0213f, 0.075998f, 0.39727f),
                new Vector3(-0.18599f, -0.14582f, -0.046029f),
                new Vector3(-0.007491f, -0.20771f, -0.048179f),
                new Vector3(0.48603f, 0.56679f, -0.003352f),
                new Vector3(-0.025618f, 0.79617f, 0.23613f),
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
            nodeSucculents = new AnchorNode[8];
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
