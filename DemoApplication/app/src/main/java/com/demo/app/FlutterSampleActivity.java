package com.demo.app;

import android.os.Bundle;
import android.widget.FrameLayout;

import com.demo.app.plugin.PluginConstant;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import io.flutter.facade.Flutter;
import io.flutter.view.FlutterView;

/**
 * Created by wangwei on 2019/7/8.
 */

public class FlutterSampleActivity extends AppCompatActivity {


    private FrameLayout frameLayout;

    private FlutterView flutterView;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.layout_flutter_content);
        frameLayout = findViewById(R.id.rl_flutter);
        // 1. 通过Flutter.createView创建FlutterView组件方式
        flutterView = Flutter.createView(this, getLifecycle(), "route2");
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT);
        // 2. 将Flutter 视图添加到原生布局中
        frameLayout.addView(flutterView, layoutParams);
//        FragmentTransaction tx = getSupportFragmentManager().beginTransaction();
//        tx.replace(R.id.rl_flutter, Flutter.createFragment("route2"));
//        tx.commit();

/*
        // MethodChannel 使用场景：Flutter端向Native端发送通知
        // name 就是双发通信的唯一标识，我们可以简单理解为钥匙即可。
        new MethodChannel(flutterView, FlutterToAndroidCHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {

                //接收来自flutter的指令oneAct
                if (methodCall.method.equals("noParams")) {
                    //跳转到指定Activity
                    Intent intent = new Intent(FlutterSampleActivity.this, FlutterPluginJumpToNativeActivity.class);
                    startActivity(intent);
                    //返回给flutter的参数
                    result.success("success");
                }

                //接收来自flutter的指令twoAct
                else if (methodCall.method.equals("withParams")) {
                    //解析参数
                    String text = methodCall.argument("flutter");
                    //带参数跳转到指定Activity
                    Intent intent = new Intent(FlutterSampleActivity.this, FlutterPluginJumpToNativeActivity.class);
                    intent.putExtra("test", text);
                    startActivity(intent);

                    //返回给flutter的参数
                    result.success("success");
                } else {
                    result.notImplemented();
                }
            }
        });


        // EventChannel 使用场景：Native端向Flutter端发送通知
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
                });*/

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
