import 'package:flutter/material.dart';

part 'color_schemes.g.dart';

Color get authModal => ThemeMode == ThemeMode.dark
    ? const Color(0xFF41474D)
    : const Color(0xFF8B9198);

ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: _lightColorScheme.primaryContainer,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _lightColorScheme.primary,
      foregroundColor: _lightColorScheme.onPrimary,
    ),
    elevatedButtonTheme: _elevatedButtonTheme,
    );

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _darkColorScheme,
      
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: _darkColorScheme.primaryContainer,
      ),
      elevatedButtonTheme: _elevatedButtonTheme,
    );

ElevatedButtonThemeData get _elevatedButtonTheme => ElevatedButtonThemeData(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
    );




