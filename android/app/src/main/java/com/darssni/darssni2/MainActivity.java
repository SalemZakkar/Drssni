package com.darssni.darssni2;

import io.flutter.embedding.android.FlutterActivity;
import android.os.Bundle;
import android.view.WindowManager.LayoutParams;

public class MainActivity extends FlutterActivity {
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        getWindow().addFlags(LayoutParams.FLAG_SECURE);
    }

}
