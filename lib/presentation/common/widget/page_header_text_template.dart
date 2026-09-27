/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Flutter imports:
import 'package:flutter/widgets.dart';

class PageHeaderText extends StatelessWidget {
  final String? text;

  const PageHeaderText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text ?? '', style: const TextStyle(fontWeight: .bold));
  }
}
