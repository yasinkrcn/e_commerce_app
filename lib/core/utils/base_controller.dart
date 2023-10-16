import 'package:flutter/material.dart';

class BaseController with ChangeNotifier {
  void refreshView() => notifyListeners();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
