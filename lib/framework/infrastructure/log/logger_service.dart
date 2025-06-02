import 'dart:io';

import 'package:astro_mobile/framework/enum/app_enum.dart';
import 'package:astro_mobile/framework/infrastructure/log/Ilogger_service.dart';
import 'package:astro_mobile/framework/infrastructure/log/logger_helper.dart';
import 'package:logger/logger.dart';

class LoggerService implements IloggerService {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      colors: true,
      dateTimeFormat: DateTimeFormat.dateAndTime,
      printEmojis: true,
    ),
    // output: FileOutput(file: File('astroclass_log.txt')),
  );

  @override
  void debug(String message) {
    if (message != "") {
      _logger.d(message);
    }
  }

  @override
  void error(String message, [dynamic error, StackTrace? stackTrace]) {
    if (message != "") {
      _logger.e(message, error: error, stackTrace: stackTrace);
    }
  }

  @override
  void info(String message) {
    if (message != "") {
      _logger.i(message);
    }
  }

  @override
  void warning(String message) {
    if (message != "") {
      _logger.w(message);
    }
  }

  void writeLog(String message, LogMessageLevel level,
      [dynamic err, StackTrace? stackTrace]) {
    final messageWithLogLevel = LoggerHelper.getLogMessageLevel(level);
    message += ": $messageWithLogLevel";
    var messageLog = message;
    if (level == LogMessageLevel.info ||
        level == LogMessageLevel.verbose ||
        level == LogMessageLevel.nothing) {
      info(message);
    } else if (level == LogMessageLevel.debug) {
      debug(message);
    } else if (level == LogMessageLevel.error) {
      error(message, err, stackTrace);
      messageLog += "${err?.toString()}, ${stackTrace?.toString()}";
    } else if (level == LogMessageLevel.warning) {
      warning(message);
    } else if (level == LogMessageLevel.verbose) {
      info(message);
    }
    // LoggerHelper.writeLogToFile(messageLog);
  }
}
