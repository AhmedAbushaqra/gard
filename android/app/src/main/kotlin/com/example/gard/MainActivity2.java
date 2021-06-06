package com.example.gard;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity2 extends FlutterActivity {
    private Intent forService;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this.getFlutterEngine());

        forService = new Intent(MainActivity2.this,MyService.class);
        if(Build.VERSION.SDK_INT>=Build.VERSION_CODES.O){
            startForegroundService(forService);
        }else{
            startService(forService);
        }
    }
}
