// Package imports:
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ENV {
  static String get appName => dotenv.get('APP_NAME', fallback: 'Bareo');
}
