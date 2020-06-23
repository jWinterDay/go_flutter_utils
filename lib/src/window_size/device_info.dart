import 'package:flutter/foundation.dart';

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

  // custom
  resize,
}

class DesktopDeviceInfo {
  const DesktopDeviceInfo({
    @required this.minW,
    @required this.minH,
    @required this.maxW,
    @required this.maxH,
  });

  factory DesktopDeviceInfo.symmetric({
    @required int w,
    @required int h,
  }) =>
      DesktopDeviceInfo(
        minW: w,
        minH: h,
        maxW: w,
        maxH: h,
      );

  final int minW;
  final int minH;
  final int maxW;
  final int maxH;
}

final kDeviceInfoList = <DesktopDeviceName, DesktopDeviceInfo>{
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
