import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.black54,
          hoverColor: Colors.white24,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          splashColor: Colors.white54,
        ),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 5,
            shadowColor: Colors.black12,
            titleTextStyle: GoogleFonts.notoSans(
                textStyle: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ))),
        textTheme: TextTheme(
            bodyText1: GoogleFonts.notoSans(
              textStyle: const TextStyle(
                color: Colors.black87,
              ),
            ),
            headline1: GoogleFonts.notoSans(
                textStyle: const TextStyle(
              color: Colors.black87,
              fontSize: 28,
              fontWeight: FontWeight.w600,
            )),
            headline2: GoogleFonts.notoSans(
                textStyle: const TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            )),
            headline3: GoogleFonts.notoSans(
                textStyle: const TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            )),
            headline4: GoogleFonts.notoSans(
                textStyle: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            )),
            subtitle1: GoogleFonts.notoSans(
                textStyle: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            )),
            subtitle2: GoogleFonts.notoSans(
                textStyle: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            )),
            button: GoogleFonts.notoSans(
                textStyle: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ))),
        backgroundColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black54,
          extendedTextStyle: GoogleFonts.notoSans(
            textStyle: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
}
