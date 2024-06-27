import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDark = true;
  Color _currentColor = Colors.black;
  Brightness _brightness = Brightness.light;

  bool get isDark => _isDark;
  Color get currentColor => _currentColor;
  Brightness get brightness => _isDark ? Brightness.dark : Brightness.light;

  void updateColor(Color color){
    _currentColor = color;
    notifyListeners();
  }
  void toggleDarkMode(bool isDarkActive){
    _isDark = isDarkActive;
    _brightness = isDarkActive ? Brightness.dark : Brightness.light;
    notifyListeners();
  }
}