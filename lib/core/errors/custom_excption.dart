class CustomExcption implements Exception {
  final String errMessage;

  CustomExcption({required this.errMessage});
  @override
  String toString() {
    // TODO: implement toString
    return errMessage;
  }
}
