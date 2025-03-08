class NullResponseException implements Exception {
  final String message;
  NullResponseException(this.message);

  @override
  String toString() => 'NullResponseException: $message';
}