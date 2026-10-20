/*
 * Copyright (c) 2026 Bareo. All rights reserved.
 *
 * This software is the proprietary and confidential property of the author.
 * Unauthorized copying, distribution, or use is strictly prohibited.
 */

class ApiErrorResponse<T> {
  final int statusCode;
  final String status;
  final String? message;
  final String? exception;
  final String? debugMessage;
  final List<T>? errors;

  ApiErrorResponse({
    required this.statusCode,
    required this.status,
    this.message,
    this.exception,
    this.debugMessage,
    this.errors,
  });

  factory ApiErrorResponse.fromJson(Map<String, Object?> json) {
    return ApiErrorResponse(
      statusCode: json['statusCode'] as int,
      status: json['status'] as String,
      message: json['message'] as String?,
      exception: json['exception'] as String?,
      debugMessage: json['debugMessage'] as String?,
      errors: json['errors'] as List<T>?,
    );
  }
}
