/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import '../../../app/configuration/environment.dart';
import '../../common/page/page_template.dart';
import '../../common/widget/page_header_template.dart';

class HomePage extends StatelessWidget {
  static final String routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String? userDisplayName = FirebaseAuth.instance.currentUser?.displayName;

    return PageTemplate(
      header: PageHeader(title: ENV.APP_NAME),
      child: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [Text('Hola, $userDisplayName')],
        ),
      ),
    );
  }
}
