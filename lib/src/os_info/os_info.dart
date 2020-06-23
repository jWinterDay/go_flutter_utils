import 'dart:io';
import 'package:go_flutter_utils/go_flutter_utils.dart';

const String _kMethod = 'get_os_info';

class OsInfo {
  Future<Map<String, dynamic>> getInfo() async {
    if (Platform.isAndroid || Platform.isIOS) {
      // print('not supported platform: ${Platform.operatingSystem}');
      return null;
    }

    final Map<String, dynamic> info = await kOsInfoChannel.invokeMethod(
      _kMethod,
    );

    return info;
  }
}
