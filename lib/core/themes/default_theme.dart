import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTheme{
  static ThemeData buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
      colorScheme: baseTheme.colorScheme.copyWith(
        primary:  const Color.fromRGBO(12, 84, 190, 1),
        secondary: const Color.fromRGBO(48, 63, 96, 1),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(231, 49)
        )
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16
          ),
        )
      ),
      scaffoldBackgroundColor: const Color.fromRGBO(245, 249, 253, 1),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color:Colors.transparent),
          borderRadius: BorderRadius.circular(10)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color:Color.fromRGBO(12, 84, 190, 1)),
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}