import 'dart:io';

import 'package:go_flutter_utils/go_flutter_utils.dart';

const String _kMethod = 'log';

class Logger {
  void d(
    String text, {
    String path = 'desktop_log.txt',
    String prefix = '[DEBUG] ',
  }) {
    if (Platform.isAndroid || Platform.isIOS) {
      // print('not supported platform: ${Platform.operatingSystem}');
      return;
    }

    kLoggerChannel.invokeMethod(
      _kMethod,
      <String, dynamic>{
        'path': path,
        'prefix': prefix,
        'text': text,
      },
    );
  }
}
