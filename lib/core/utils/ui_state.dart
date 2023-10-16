import 'dart:developer';

import 'package:e_commerce_app/core/error/failure/failure.dart';

class UIState<T> {
  late UIStateStatus status;
  late T data;
  late Failure failure;
  UIState.idle() : status = UIStateStatus.idle;
  UIState.loading() : status = UIStateStatus.loading;
  UIState.success(this.data) : status = UIStateStatus.success;
  UIState.error(this.failure, {StackTrace? stackTrace, bool logException = true}) {
    status = UIStateStatus.error;

    if (logException) {
      log(logException.toString());
    }
  }

  bool get isIdle => status == UIStateStatus.idle;
  bool get isLoading => status == UIStateStatus.loading;
  bool get isSuccess => status == UIStateStatus.success;
  bool get isError => status == UIStateStatus.error;
}

enum UIStateStatus { idle, loading, success, error }
