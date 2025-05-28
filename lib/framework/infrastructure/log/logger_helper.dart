import 'dart:io';

import 'package:flutter_app/framework/enum/app_enum.dart';

class LoggerHelper {
  static String getLogMessageLevel(LogMessageLevel level) {
    switch (level) {
      case LogMessageLevel.nothing:
        return "00";
      case LogMessageLevel.verbose:
        return "01";
      case LogMessageLevel.debug:
        return "02";
      case LogMessageLevel.info:
        return "03";
      case LogMessageLevel.warning:
        return "04";
      case LogMessageLevel.error:
        return "05";
    }
  }

  static Future<File> _getLogFile() async {
    // var docPath = await getApplicationDocumentsDirectory();
    var docPath = "";
    final filePath = "$docPath/filmicall_logs.txt";
    return File(filePath);
  }

  static void writeLogToFile(String message) async {
    final filePath = await _getLogFile();
    await filePath.writeAsString("$message\n", mode: FileMode.append);
  }
}
