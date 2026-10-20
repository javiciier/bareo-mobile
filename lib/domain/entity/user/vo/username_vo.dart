/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Project imports:
import '../../../../shared/value_object.dart';

class UsernameVO extends ValueObject<String> {
  static const int min_length = 5;
  static const int max_length = 50;

  const UsernameVO._(String value) : super(value: value);

  factory UsernameVO(String value) {
    ArgumentError.checkNotNull(value, 'Username cannot be null');

    if (value.trim().isEmpty) {
      throw ArgumentError('Username cannot be blank');
    }

    if (value.length < min_length || value.length > max_length) {
      throw ArgumentError('Username length must be between $min_length and $max_length characters');
    }

    return UsernameVO._(value);
  }
}
