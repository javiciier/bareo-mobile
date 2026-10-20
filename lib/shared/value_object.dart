/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

abstract class ValueObject<T> {
  final T value;

  const ValueObject({required this.value});

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ValueObject<T> && runtimeType == other.runtimeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => '$runtimeType[$value]';
}
