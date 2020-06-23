library go_flutter_utils;

import 'package:go_flutter_utils/src/logger/logger.dart';
import 'package:go_flutter_utils/src/os_info/os_info.dart';
import 'package:go_flutter_utils/src/window_size/device_info.dart';
import 'package:go_flutter_utils/src/window_size/window_size.dart';

class GoFlutterUtils {
  // window size
  Future<void> setDevice(DesktopDeviceName desktopDeviceName) async {
    await WindowSize.setDevice(desktopDeviceName);
  }

  Future<void> setCustomSize({int minW, int minH, int maxW, int maxH}) async {
    await WindowSize.setCustomSize(minW: minW, minH: minH, maxW: maxW, maxH: maxH);
  }

  // logger
  Future<void> d(
    String text, {
    String path = 'desktop_log.txt',
    String prefix = '[DEBUG] ',
  }) async {
    await Logger.d(text, path: path, prefix: prefix);
  }

  Future<void> e(
    String text, {
    String path = 'desktop_log.txt',
    String prefix = '[ERROR] ',
  }) async {
    await Logger.e(text, path: path, prefix: prefix);
  }

  // os info
  Future<Map<String, dynamic>> getInfo() async {
    return await OsInfo.getInfo();
  }
}
