class ErrorResponse {
  late String message;
  late int? code;

  ErrorResponse.fromJson(Map<String, dynamic>? json) {
    message = json == null ? "" : json['status_message'];
    code = json == null ? 0 : json['status_code'];
  }
}