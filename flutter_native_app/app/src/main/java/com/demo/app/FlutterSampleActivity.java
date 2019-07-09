package com.demo.app;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.widget.FrameLayout;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import io.flutter.facade.Flutter;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.view.FlutterView;

/**
 * Created by wangwei on 2019/7/8.
 */

public class FlutterSampleActivity extends AppCompatActivity {

    private FrameLayout frameLayout;

    private FlutterView flutterView;

    public static final String FlutterToAndroidCHANNEL = "com.demo.app.toandroid/plugin";
    public static final String AndroidToFlutterCHANNEL = "com.demo.app.toflutter/plugin";

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
        // MethodChannel 使用场景：Flutter端向Native端发送通知,name 就是双发通信的唯一标识，我们可以简单理解为钥匙即可。
        new MethodChannel(flutterView, FlutterToAndroidCHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                //接收来自flutter的指令oneAct
                if (methodCall.method.equals("flutterToNative")) {
                    //解析参数
                    String value = methodCall.argument("flutter");
                    //带参数跳转到指定Activity
                    Intent intent = new Intent(FlutterSampleActivity.this, FlutterPluginJumpToNativeActivity.class);
                    intent.putExtra("value", value + "---第一种");
                    startActivity(intent);
                    //返回给flutter的参数
                    //result.success("success");
                    result.success("success--电量--" + getBatteryLevel());
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
                });

        Log.w("---", "--->" + getBatteryLevel());
    }

    /**
     * 获取电量
     */
    private int getBatteryLevel() {
        int batteryLevel = -1;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(getApplicationContext()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }

        return batteryLevel;
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
