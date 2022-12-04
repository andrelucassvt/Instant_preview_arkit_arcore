import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'instant_preview_arkit_arcore_method_channel.dart';

abstract class InstantPreviewArkitArcorePlatform extends PlatformInterface {
  /// Constructs a InstantPreviewArkitArcorePlatform.
  InstantPreviewArkitArcorePlatform() : super(token: _token);

  static final Object _token = Object();

  static InstantPreviewArkitArcorePlatform _instance =
      MethodChannelInstantPreviewArkitArcore();

  /// The default instance of [InstantPreviewArkitArcorePlatform] to use.
  ///
  /// Defaults to [MethodChannelInstantPreviewArkitArcore].
  static InstantPreviewArkitArcorePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InstantPreviewArkitArcorePlatform] when
  /// they register themselves.
  static set instance(InstantPreviewArkitArcorePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> showPreviewArLocal({required String path}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
