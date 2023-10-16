import 'package:e_commerce_app/core/error/failure/failure.dart';
import 'package:e_commerce_app/core/extension/string_extension.dart';

class LocationError extends Failure {
  LocationError({String? errorText}) : super(errorText: errorText);

  @override
  String get message => errorText.getValueOrDefault;
}
