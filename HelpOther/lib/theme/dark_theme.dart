import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  buttonTheme: ButtonThemeData(
    colorScheme: ColorScheme.dark(
      background: Color(0xFF20A4F3),
      primary: Colors.white
    )
  ),
  iconTheme: IconThemeData(
    color: Colors.white
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.breeSerif(
      color: Colors.white,
        fontSize: 30
    ),
        titleMedium: GoogleFonts.breeSerif(
      color: Colors.white,
    fontSize: 20
  ),
      labelLarge: GoogleFonts.bowlbyOneSc(
        color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14
  ),
    labelMedium: GoogleFonts.aBeeZee(
      color: Colors.white,fontSize: 15
    ),
    titleSmall: GoogleFonts.breeSerif(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold
    ),
    labelSmall: GoogleFonts.montserrat(
      color: Colors.white, fontWeight: FontWeight.bold,fontSize: 17
    ),
    headlineLarge: GoogleFonts.montserrat(
      color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold
    ),
    headlineMedium: GoogleFonts.montserrat(
      color: Color(0xFF20A4F3), fontWeight: FontWeight.bold, fontSize: 15
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF161717),
    selectedItemColor: Color(0xFF20A4F3),
    unselectedItemColor: Color(0xF030FF3),
    elevation: 3,

    selectedIconTheme: IconThemeData(
      color: Color(0xFF20A4F3),

    ),
  ),
  colorScheme: ColorScheme.dark(
  background : Color(0xFF171819),
    primary: Color(0xFF20A4F3),
    secondary: Colors.white,
    tertiary: Colors.blueGrey[700]
  ),
);