import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'instant_preview_arkit_arcore_platform_interface.dart';

/// An implementation of [InstantPreviewArkitArcorePlatform] that uses method channels.
class MethodChannelInstantPreviewArkitArcore
    extends InstantPreviewArkitArcorePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('instant_preview_arkit_arcore');

  @override
  Future<void> showPreviewAr({required String reference}) async {
    await methodChannel.invokeMethod<bool>('showPreviewAr', reference);
  }
}
