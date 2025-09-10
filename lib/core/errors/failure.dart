class CustomFailure {
  final String errMessage;

  CustomFailure({required this.errMessage});
}

class ServerFailure extends CustomFailure {
  ServerFailure({required super.errMessage});
}
