import 'package:e_commerce_app/core/error/failure/failure.dart';

class BadRequestFailure extends Failure {
  BadRequestFailure({String? errorText}) : super(errorText: errorText);
  @override
  String get message => errorText ?? "Bad Request Failure";
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure({String? errorText}) : super(errorText: errorText);
  @override
  String get message => "Unauthorized Failure";
}

class ForbiddenFailure extends Failure {
  ForbiddenFailure({String? errorText}) : super(errorText: errorText);
  @override
  String get message => "Forbidden Failure";
}

class NotFoundFailure extends Failure {
  NotFoundFailure({String? errorText}) : super(errorText: errorText);
  @override
  String get message => errorText ?? "Not Found Failure";
}

class InternalFailure extends Failure {
  InternalFailure({String? errorText}) : super(errorText: errorText);
  @override
  String get message => "Internal Failure";
}

class GatewayTimeOutFailure extends Failure {
  GatewayTimeOutFailure({String? errorText}) : super(errorText: errorText);
  @override
  String get message => "Gateway Time Out Failure";
}
