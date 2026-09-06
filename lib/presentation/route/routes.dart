// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../screen/initial_screen.dart';

const String applicationInitialRoute = '/';

Map<String, WidgetBuilder> getApplicationRoutes() => {
  applicationInitialRoute: (context) => const InitialScreen(),
};
