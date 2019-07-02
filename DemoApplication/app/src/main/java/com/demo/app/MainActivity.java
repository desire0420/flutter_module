package com.demo.app;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.widget.FrameLayout;
import android.widget.TextView;

import io.flutter.facade.Flutter;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.view.FlutterView;

public class MainActivity extends AppCompatActivity {

    private TextView textView;

    private FrameLayout frameLayout;

    private FlutterView flutterView;

    public static final String FlutterToAndroidCHANNEL = "com.demo.app.toandroid/plugin";
    public static final String AndroidToFlutterCHANNEL = "com.demo.app.toflutter/plugin";

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        textView = findViewById(R.id.params);
        frameLayout = findViewById(R.id.rl_flutter);

        flutterView = Flutter.createView(this, getLifecycle(), "route2");
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT);
        frameLayout.addView(flutterView, layoutParams);

        new EventChannel(flutterView, AndroidToFlutterCHANNEL)
                .setStreamHandler(new EventChannel.StreamHandler() {
                    @Override
                    public void onListen(Object o, EventChannel.EventSink eventSink) {
                        String androidParmas = "来自android原生的参数abc";
                        eventSink.success(androidParmas);
                    }

                    @Override
                    public void onCancel(Object o) {

                    }
                });


        new MethodChannel(flutterView, FlutterToAndroidCHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {

                //接收来自flutter的指令oneAct
                if (methodCall.method.equals("noParams")) {
                    //跳转到指定Activity
                    Intent intent = new Intent(MainActivity.this, SampleActivity.class);
                    startActivity(intent);
                    //返回给flutter的参数
                    result.success("success");
                }

                //接收来自flutter的指令twoAct
                else if (methodCall.method.equals("withParams")) {
                    //解析参数
                    String text = methodCall.argument("flutter");
                    //带参数跳转到指定Activity
                    Intent intent = new Intent(MainActivity.this, SampleActivity.class);
                    intent.putExtra("test", text);
                    startActivity(intent);

                    //返回给flutter的参数
                    result.success("success");
                } else {
                    result.notImplemented();
                }
            }
        });

    }

    @Override
    public void onBackPressed() {
        if (this.flutterView != null) {
            this.flutterView.popRoute();
        } else {
            super.onBackPressed();
        }
    }
}