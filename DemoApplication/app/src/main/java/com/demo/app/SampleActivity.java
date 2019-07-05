package com.demo.app;

import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import android.text.TextUtils;
import android.widget.Button;
import android.widget.Toast;

/**
 * Created by wangwei on 2019/7/1.
 */

public class SampleActivity extends AppCompatActivity {
    private Button btn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main_content);
        btn = findViewById(R.id.btn);
        String params = getIntent().getStringExtra("test");
        if (!TextUtils.isEmpty(params)) {
            Toast.makeText(this, "" + params, Toast.LENGTH_SHORT).show();
            btn.setText("flutter 传参:" + params);

        }
    }
}
