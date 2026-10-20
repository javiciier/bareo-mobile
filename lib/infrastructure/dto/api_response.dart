/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

class ApiResponse<T> {
  final bool success;
  final DateTime timestamp;
  final T? data;

  ApiResponse({required this.success, required this.timestamp, this.data});

  factory ApiResponse.fromJson(Map<String, Object?> json) {
    return ApiResponse(
      success: json['success'] as bool,
      timestamp: DateTime.parse(json['timestamp'] as String),
      data: json['data'] as T?,
    );
  }
}
