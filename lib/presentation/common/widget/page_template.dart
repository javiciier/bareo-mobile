/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Flutter imports:
import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final Widget child;
  final String? title;
  final Widget? floatingActionButton;

  const PageTemplate({
    super.key,
    required this.child,
    this.title,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null ? AppBar(title: Text(title!)) : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: child,
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
