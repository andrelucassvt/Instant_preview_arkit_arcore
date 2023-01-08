package com.andre.instant_preview_arkit_arcore

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import androidx.annotation.NonNull
import androidx.core.content.ContextCompat.startActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** InstantPreviewArkitArcorePlugin */
class InstantPreviewArkitArcorePlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var context: Context? = null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "instant_preview_arkit_arcore")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.getApplicationContext();
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "showPreviewAr") {
      var path = call.arguments as String
      val sceneViewerIntent = Intent(Intent.ACTION_VIEW)
      val intentUri = Uri.parse("https://arvr.google.com/scene-viewer/1.0").buildUpon()
        .appendQueryParameter(
          "file",
          path
        )
        .appendQueryParameter("mode", "ar_only")
        .build()
      sceneViewerIntent.setData(intentUri)
      sceneViewerIntent.setPackage("com.google.ar.core")
      sceneViewerIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
      startActivity(context!!,sceneViewerIntent, Bundle())
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
