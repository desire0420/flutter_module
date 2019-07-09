package com.demo.app;

import android.os.Bundle;
import android.text.TextUtils;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

/**
 * Created by wangwei on 2019/7/1.
 * Flutter 跳转原生
 */

public class FlutterPluginJumpToNativeActivity extends AppCompatActivity {

    private TextView mTextView;

    public static final String VALUE = "value";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.main_content);

        mTextView = findViewById(R.id.text);

        String text = getIntent().getStringExtra(VALUE);

        mTextView.setText(text);

    }
}
