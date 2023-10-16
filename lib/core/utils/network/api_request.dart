import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure/failure.dart';

abstract class ApiRequest {
  static Future<Either<Failure, T>> request<T>({
    required Future<T> Function() apiCall,
  }) async {
    try {
      final result = await apiCall();
      return Right(result);
    } catch (err) {
      return Left(ServiceFailure(errorText: "$err"));
    }
  }
}
