/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Flutter imports:
import 'package:flutter/widgets.dart';

// Project imports:
import '../../../app/configuration/environment.dart';

class HomeHeader extends StatelessWidget {
  final String _title;

  HomeHeader({super.key, String? title}) : _title = title ?? ENV.APP_NAME;

  @override
  Widget build(BuildContext context) {
    return Row(children: [Text(_title)]);
  }
}
