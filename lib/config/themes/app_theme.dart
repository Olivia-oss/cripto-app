import 'package:flutter/material.dart';

class AppTheme {
  final bool isDark;

  AppTheme({this.isDark = false});

  ThemeData getThemeData() => ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light,
      );
}
