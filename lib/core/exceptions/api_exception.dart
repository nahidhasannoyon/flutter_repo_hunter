// Custom exception for API errors
class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException({required this.statusCode, required this.message});

  @override
  String toString() {
    return "API Error (Status Code: $statusCode): $message";
  }
}
