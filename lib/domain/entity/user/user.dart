/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Project imports:
import '../../../shared/enums/user_gender.dart';
import '../../../shared/vo/email_vo.dart';
import '../../../shared/vo/iso_country_code_vo.dart';
import 'vo/user_avatar.dart';
import 'vo/user_id.dart';
import 'vo/username_vo.dart';

class User {
  final UserId id;
  final UsernameVO username;
  final EmailVO email;
  final UserGender gender;
  final String city;
  final IsoCountryCodeVO countryCode;
  final UserAvatar avatar;
  final DateTime createdAt;
  final DateTime updatedAt;

  const User({
    required this.id,
    required this.username,
    required this.email,
    required this.gender,
    required this.city,
    required this.countryCode,
    required this.avatar,
    required this.createdAt,
    required this.updatedAt,
  });
}
