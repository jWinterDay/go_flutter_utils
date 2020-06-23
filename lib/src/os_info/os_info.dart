import 'dart:io';

import 'constants.dart';

const String _kMethod = 'get_os_info';

class OsInfo {
  static Future<Map<String, dynamic>> getInfo() async {
    if (Platform.isAndroid || Platform.isIOS) {
      // print('not supported platform: ${Platform.operatingSystem}');
      return null;
    }

    final Map<String, dynamic> info = await kOsInfoChannel.invokeMapMethod<String, dynamic>(
      _kMethod,
    );

    return info;
  }
}
