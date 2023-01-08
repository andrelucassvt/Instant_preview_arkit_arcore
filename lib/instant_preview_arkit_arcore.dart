import 'instant_preview_arkit_arcore_platform_interface.dart';

class InstantPreviewArkitArcore {
  /// On Android have just compatibility for webUrl(.glb and .glft)
  ///
  /// On IOS you can add objcet (.usdz) on xcode and pass the path. For webUrl in IOS, is need to download object.
  Future<void> showPreviewAr({required String reference}) async {
    return InstantPreviewArkitArcorePlatform.instance
        .showPreviewAr(reference: reference);
  }
}
