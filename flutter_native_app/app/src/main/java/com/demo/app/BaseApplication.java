package com.demo.app;

import android.app.Application;

import io.flutter.view.FlutterMain;

/**
 * Created by wangwei on 2019/7/1.
 */

public class BaseApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        FlutterMain.startInitialization(this);
    }
}
