import 'instant_preview_arkit_arcore_platform_interface.dart';

class InstantPreviewArkitArcore {
  Future<bool> showPreviewArLocal({required String path}) {
    return InstantPreviewArkitArcorePlatform.instance
        .showPreviewArLocal(path: path);
  }
}
