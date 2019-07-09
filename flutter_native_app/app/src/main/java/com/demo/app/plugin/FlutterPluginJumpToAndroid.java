package com.demo.app.plugin;

import android.app.Activity;
import android.content.Intent;

import com.demo.app.FlutterPluginJumpToNativeActivity;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

/**
 * Created by wangwei on 2019/7/3.
 * MethodChannel 使用场景：Flutter端向Native端发送通知
 * name 就是双发通信的唯一标识，我们可以简单理解为钥匙即可。
 */

public class FlutterPluginJumpToAndroid implements MethodChannel.MethodCallHandler {
    public static final String FlutterToAndroidCHANNEL = "com.demo.app.toandroid/plugin";


    static MethodChannel channel;

    private Activity activity;

    private FlutterPluginJumpToAndroid(Activity activity) {
        this.activity = activity;
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        channel = new MethodChannel(registrar.messenger(), FlutterToAndroidCHANNEL);
        FlutterPluginJumpToAndroid instance = new FlutterPluginJumpToAndroid(registrar.activity());
        //setMethodCallHandler在此通道上接收方法调用的回调
        channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {

        //通过MethodCall可以获取参数和方法名，然后再寻找对应的平台业务，本案例做了2个跳转的业务
        //接收来自flutter的指令oneAct
        if (methodCall.method.equals("noParams")) {
            //跳转到指定Activity
            Intent intent = new Intent(activity, FlutterPluginJumpToNativeActivity.class);
            activity.startActivity(intent);
            //返回给flutter的参数
            result.success("success");
        }

        //接收来自flutter的指令twoAct
        else if (methodCall.method.equals("withParams")) {
            //解析参数
            String text = methodCall.argument("flutter");
            //带参数跳转到指定Activity
            Intent intent = new Intent(activity, FlutterPluginJumpToNativeActivity.class);
            intent.putExtra("test", text);
            activity.startActivity(intent);

            //返回给flutter的参数
            result.success("success");
        } else {
            result.notImplemented();
        }
    }

}