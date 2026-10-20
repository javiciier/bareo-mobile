/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Project imports:
import '../value_object.dart';

class EmailVO extends ValueObject<String> {
  static final RegExp _emailPattern = RegExp(
    r'^(?<user>[a-zA-Z0-9._%+-]+)@(?<domain>[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*)\.(?<tld>[a-zA-Z]{2,})$',
  );

  const EmailVO._(String value) : super(value: value);

  factory EmailVO(String value) {
    ArgumentError.checkNotNull(value, 'Email cannot be null');

    final normalizedValue = value.trim().toLowerCase();

    if (normalizedValue.trim().isEmpty) {
      throw ArgumentError('Email cannot be blank');
    }

    if (!_emailPattern.hasMatch(normalizedValue)) {
      throw ArgumentError('Invalid email format');
    }

    return EmailVO._(normalizedValue);
  }
}
