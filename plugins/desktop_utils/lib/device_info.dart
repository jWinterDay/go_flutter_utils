import 'package:flutter/foundation.dart';

class DesktopDeviceInfo {
  DesktopDeviceInfo({
    @required this.minW,
    @required this.minH,
    @required this.maxW,
    @required this.maxH,
  });

  factory DesktopDeviceInfo.symmetric({@required int w, @required int h}) => DesktopDeviceInfo(
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
