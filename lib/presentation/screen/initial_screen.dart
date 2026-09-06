// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../app/configuration/environment.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(ENV.appName)));
  }
}
