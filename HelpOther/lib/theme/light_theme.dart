import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
  buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.light(
          background: Color(0xFF2541B2),
          primary: Colors.black
      )
  ),
  iconTheme: IconThemeData(
      color: Colors.black
  ),
  textTheme: TextTheme(
      titleLarge: GoogleFonts.breeSerif(
          color: Colors.black,
          fontSize: 30
      ),
      titleMedium: GoogleFonts.breeSerif(
          color: Colors.black,
          fontSize: 20
      ),
      labelLarge: GoogleFonts.bowlbyOneSc(
          color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14
      ),
      labelMedium: GoogleFonts.aBeeZee(
          color: Colors.black,fontSize: 15
      ),
      titleSmall: GoogleFonts.breeSerif(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold
      ),
      labelSmall: GoogleFonts.montserrat(
          color: Colors.black, fontWeight: FontWeight.bold,fontSize: 17
      ),
      headlineLarge: GoogleFonts.montserrat(
          color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold
      ),
      headlineMedium: GoogleFonts.montserrat(
          color: Color(0xFF20A4F3), fontWeight: FontWeight.bold, fontSize: 15
      ),

  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFFCF8F8),
    selectedItemColor: Color(0xFF2541B2),
    unselectedItemColor: Color(0xF030FF3),
    elevation: 3,

    selectedIconTheme: IconThemeData(
      color: Color(0xFF2541B2),

    ),
  ),
  colorScheme: ColorScheme.light(
      background : Color(0xFFFFFFFF),
      primary: Color(0xFF2541B2),
      secondary: Colors.black,
      tertiary: Colors.blueGrey[700]
  ),
);