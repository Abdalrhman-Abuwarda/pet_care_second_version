import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier{
  bool isHiddenLoginPassword = true;

  void visibilityLoginPassword() {
    isHiddenLoginPassword = !isHiddenLoginPassword;
    notifyListeners();
  }
}

