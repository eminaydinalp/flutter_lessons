import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDark = false;
  bool get isDark => _isDark;

  void toggleTheme(bool value){

    _isDark = value;
    notifyListeners();
  }
}