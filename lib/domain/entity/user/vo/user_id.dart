/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Project imports:
import '../../../../shared/value_object.dart';

class UserId extends ValueObject<String> {
  const UserId._(String value) : super(value: value);

  factory UserId(String value) {
    ArgumentError.checkNotNull(value, 'User ID cannot be null');

    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      throw ArgumentError('User ID cannot be blank');
    }

    return UserId._(trimmed);
  }
}
