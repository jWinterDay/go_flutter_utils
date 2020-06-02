import 'dart:io';
import 'package:flutter/services.dart';

import 'device_info.dart';

// method channel names
const MethodChannel _loggerChannel = MethodChannel('jWinterDay/desktop_utils');

enum DesktopDeviceName {
  // ios
  iPhone5SE,
  iPhone8,
  iPhone8Plus,
  iPhoneX,

  // android

  nexus5,
  nexus10,
  pixel3,
}

final _deviceInfoList = <DesktopDeviceName, DesktopDeviceInfo>{
  // ios
  DesktopDeviceName.iPhone5SE: DesktopDeviceInfo.symmetric(w: 320, h: 568),
  DesktopDeviceName.iPhone8: DesktopDeviceInfo.symmetric(w: 375, h: 667),
  DesktopDeviceName.iPhone8Plus: DesktopDeviceInfo.symmetric(w: 414, h: 736),
  DesktopDeviceName.iPhoneX: DesktopDeviceInfo.symmetric(w: 375, h: 812),

  // android
  DesktopDeviceName.nexus5: DesktopDeviceInfo.symmetric(w: 360, h: 640),
  DesktopDeviceName.nexus10: DesktopDeviceInfo.symmetric(w: 800, h: 1280),
  DesktopDeviceName.pixel3: DesktopDeviceInfo.symmetric(w: 412, h: 824),
};

class DesktopUtils {
  static void setDevice(DesktopDeviceName desktopDeviceName) {
    assert(desktopDeviceName != null);

    if (Platform.isAndroid || Platform.isIOS) {
      // print('not supported platform: ${Platform.operatingSystem}');
      return;
    }

    final deviceSize = _deviceInfoList[desktopDeviceName];

    _loggerChannel.invokeMethod(
      'set_window_size',
      <String, dynamic>{
        'minW': deviceSize.minW,
        'minH': deviceSize.minH,
        'maxW': deviceSize.maxW,
        'maxH': deviceSize.maxH,
      },
    );
  }

  static void setCustomSize({int minW, int minH, int maxW, int maxH}) {
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

    _loggerChannel.invokeMethod(
      'set_window_size',
      <String, dynamic>{
        'minW': minW,
        'minH': minH,
        'maxW': maxW,
        'maxH': maxH,
      },
    );
  }
}
