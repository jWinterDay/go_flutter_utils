import 'dart:io';

import 'constants.dart';
import 'device_info.dart';

const String _kMethod = 'set_window_size';

class WindowSize {
  static Future<void> setDevice(DesktopDeviceName desktopDeviceName) async {
    assert(desktopDeviceName != null);

    if (Platform.isAndroid || Platform.isIOS) {
      // print('not supported platform: ${Platform.operatingSystem}');
      return;
    }

    final deviceSize = kDeviceInfoList[desktopDeviceName];

    await kWindowSizeChannel.invokeMethod(
      _kMethod,
      <String, dynamic>{
        'minW': deviceSize.minW,
        'minH': deviceSize.minH,
        'maxW': deviceSize.maxW,
        'maxH': deviceSize.maxH,
      },
    );
  }

  static Future<void> setCustomSize({int minW, int minH, int maxW, int maxH}) async {
    assert(minW != null);
    assert(minH != null);
    assert(maxW != null);
    assert(maxH != null);

    assert(minW < maxW && minW > 0);
    assert(minH < maxH && minH > 0);

    if (Platform.isAndroid || Platform.isIOS) {
      // print('not supported platform: ${Platform.operatingSystem}');
      return;
    }

    await kWindowSizeChannel.invokeMethod(
      _kMethod,
      <String, dynamic>{
        'minW': minW,
        'minH': minH,
        'maxW': maxW,
        'maxH': maxH,
      },
    );
  }
}
