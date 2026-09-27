/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../widget/page_header_template.dart';

class PageTemplate extends StatelessWidget {
  final PageHeader? header;
  final Widget child;
  final Widget? footer;
  final Widget? floatingActionButton;

  const PageTemplate({
    super.key,
    this.header,
    required this.child,
    this.footer,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 12.0,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ?header,
            Expanded(
              child: Padding(padding: padding, child: child),
            ),
            ?footer,
          ],
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
