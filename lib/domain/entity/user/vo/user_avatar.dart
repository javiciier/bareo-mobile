/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Project imports:
import '../../../../shared/value_object.dart';

class UserAvatar extends ValueObject<Uri> {
  const UserAvatar._(Uri value) : super(value: value);

  factory UserAvatar(Uri value) {
    ArgumentError.checkNotNull(value, 'Avatar URL cannot be null');

    if (!value.hasAbsolutePath && !value.isAbsolute) {
      throw ArgumentError('Avatar URL must be absolute');
    }

    final scheme = value.scheme.toLowerCase();
    if (scheme != 'http' && scheme != 'https') {
      throw ArgumentError('Avatar URL must be HTTP or HTTPS');
    }

    return UserAvatar._(value);
  }

  factory UserAvatar.of(String? rawUrl) {
    if (rawUrl == null || rawUrl.trim().isEmpty) {
      throw ArgumentError('Avatar URL cannot be blank');
    }

    final uri = Uri.tryParse(rawUrl.trim());

    if (uri == null || !uri.hasAbsolutePath && !uri.isAbsolute) {
      throw ArgumentError('Avatar URL is invalid $rawUrl');
    }

    try {
      return UserAvatar(uri);
    } catch (_) {
      throw ArgumentError('Avatar URL is invalid $rawUrl');
    }
  }
}
