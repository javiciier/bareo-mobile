/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../app/configuration/dependency_injection.dart';
import '../../../application/usecase/authentication/logout_with_google_use_case.dart';
import 'page_header_text_template.dart';

class PageHeader extends StatelessWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;

  const PageHeader({super.key, this.actions, this.leading, this.title});

  void _logout() async {
    LogoutWithGoogleUseCase logoutUseCase = GET_IT<LogoutWithGoogleUseCase>();
    await logoutUseCase.execute();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
        ),
        child: Stack(
          alignment: .center,
          children: [
            // Page title in the background, always centered
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: PageHeaderText(text: title),
              ),
            ),
            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side (show nothing if no leading received)
                leading ?? const SizedBox.shrink(),

                // Right side
                Row(
                  mainAxisSize: .min,
                  children: [
                    ...?actions,
                    // Logout icon at the end
                    IconButton(icon: const Icon(Icons.logout), onPressed: () => _logout()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
