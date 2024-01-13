package com.darssni.darssni2;

import android.content.Intent;
import android.os.Bundle;
import android.view.WindowManager.LayoutParams;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // prevent screenshot
        getWindow().addFlags(LayoutParams.FLAG_SECURE);
    }

//    @Override
//    public void startActivity(Intent intent) {
//        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK);
//        super.startActivity(intent);
//    }
}
