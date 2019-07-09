package com.demo.app;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.demo.app.plugin.FlutterPluginJumpToAndroid;

import androidx.annotation.Nullable;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private TextView textView;
    private LinearLayout one, two, three, four;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        findView();
        setListener();
        GeneratedPluginRegistrant.registerWith(this);
        registerCustomPlugin(this);
    }

    private static void registerCustomPlugin(PluginRegistry registrar) {
        FlutterPluginJumpToAndroid.registerWith(registrar.registrarFor(FlutterPluginJumpToAndroid.CHANNEL));
    }


    private void findView() {
        one = findViewById(R.id.one);
        two = findViewById(R.id.two);
        three = findViewById(R.id.three);
        four = findViewById(R.id.four);
        textView = findViewById(R.id.params);
    }

    private void setListener() {
        one.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(MainActivity.this, FlutterSampleActivity.class));
            }
        });

        two.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(MainActivity.this, NativeActivity.class));
            }
        });

        three.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {


            }
        });
    }
}