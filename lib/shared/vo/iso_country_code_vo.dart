/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

// Package imports:
import 'package:country_iso/country_iso.dart';

// Project imports:
import '../value_object.dart';

class IsoCountryCodeVO extends ValueObject<String> {
  const IsoCountryCodeVO._(String value) : super(value: value);

  factory IsoCountryCodeVO(String value) {
    ArgumentError.checkNotNull(value, 'Country code cannot be null');
    final normalizedValue = value.trim().toUpperCase();

    if (normalizedValue.isEmpty) {
      throw ArgumentError('Country code cannot be blank');
    }
    if (normalizedValue.length != 2) {
      throw ArgumentError('Country code must be in ISO3166-1 alpha-2 format');
    }

    if (!CountryISO.isValid(normalizedValue)) {
      throw ArgumentError('Invalid country code');
    }

    return IsoCountryCodeVO._(normalizedValue);
  }
}
