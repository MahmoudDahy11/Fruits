class CustomException implements Exception {
  final String errMessage;

  CustomException({required this.errMessage});
  @override
  String toString() {
    // TODO: implement toString
    return errMessage;
  }
}
