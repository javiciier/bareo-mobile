// Dart imports:
import 'dart:isolate';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:logging/logging.dart';

void setupLoggers() {
  Logger.root.level = kDebugMode ? .ALL : .WARNING;
  Logger.root.onRecord.listen(_onLogRecordCallback);
}

void _onLogRecordCallback(LogRecord record) {
  if (kDebugMode) {
    _configureLoggerForDebugMode(record);
  }

  // An external logs provider for production can be configured here
}

void _configureLoggerForDebugMode(LogRecord record) {
  final String date = record.time.toIso8601String();
  final String emoji = _getEmojiForLevel(record.level);
  final String level = record.level.name.padRight(8);
  final String thread = '[${Isolate.current.debugName ?? 'main'}]';
  final String logger = record.loggerName;
  final String message = record.message;

  // Log format: ${date} ${requestTrace} ${level} ${thread} ${logger} - ${message}%n
  final String logRecord = '$date $level $emoji $thread $logger - $message';
  debugPrint(logRecord);
  if (record.error != null) {
    debugPrint('\tError: ${record.error}');
  }
  if (record.stackTrace != null) {
    debugPrint('\tStack trace:\n${record.stackTrace}');
  }
}

String _getEmojiForLevel(Level level) {
  switch (level.name) {
    case 'FINEST':
      return '🔍';
    case 'FINER':
      return '🔬';
    case 'FINE':
      return '🐛';
    case 'CONFIG':
      return '⚙️';
    case 'INFO':
      return 'ℹ️';
    case 'WARNING':
      return '⚠️';
    case 'SEVERE':
      return '💥';
    case 'SHOUT':
      return '🚨';
    default:
      return '💬';
  }
}
