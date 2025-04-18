import 'dart:io';

import 'package:flutter/foundation.dart';

class PlatformUtils {
  // detect platform
  static String getPlatformType() {
    if (kIsWeb) return 'web';

    try {
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        return 'desktop';
      }
      if (Platform.isAndroid || Platform.isIOS) {
        return 'mobile';
      }
    } catch (e) {
      return 'web';
    }
    return 'unknown';
  }

  // quick check
  static bool isDesktop() {
    return getPlatformType() == 'desktop';
  }

  static bool isMobile() {
    return getPlatformType() == 'mobile';
  }

  static bool isWeb() {
    return getPlatformType() == 'web';
  }
}
