import 'dart:io';

import 'constants.dart';

const String _kMethod = 'log';

class Logger {
  static Future<void> d(
    String text, {
    String path = 'desktop_log.txt',
    String prefix = '[DEBUG] ',
  }) async {
    if (Platform.isAndroid || Platform.isIOS) {
      // print('not supported platform: ${Platform.operatingSystem}');
      return;
    }

    await kLoggerChannel.invokeMethod(
      _kMethod,
      <String, dynamic>{
        'path': path,
        'prefix': prefix,
        'text': text,
      },
    );
  }

  static Future<void> e(
    String text, {
    String path = 'desktop_log.txt',
    String prefix = '[ERROR] ',
  }) async {
    await d(text, path: path, prefix: prefix);
  }
}
