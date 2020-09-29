import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = ColorScheme.light(
      primary: Color(0xFF0E1C32),
      secondary: Color(0xFF24E6FF),
      primaryVariant: Color(0xFF0E1C32),
      secondaryVariant: Color(0xFF24E6FF),
      surface: Color(0xFF11253F),
      background: Color(0xFF050717),
      error: Color(0xFFFF3131),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFF000000),
      onError: Color(0xFFFD9726),
      onBackground: Color(0xFF000000),
      brightness: Brightness.light,
    );
    final TextTheme textTheme = TextTheme(
      headline1: GoogleFonts.poppins(
          fontSize: 93, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      headline2: GoogleFonts.poppins(
          fontSize: 58, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      headline3: GoogleFonts.poppins(
        fontSize: 46,
        fontWeight: FontWeight.w400,
      ),
      headline4: GoogleFonts.poppins(
          fontSize: 33, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headline5: GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400),
      headline6: GoogleFonts.poppins(
          fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      subtitle1: GoogleFonts.poppins(
          fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      subtitle2: GoogleFonts.poppins(
          fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyText1: GoogleFonts.sourceSansPro(
          fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyText2: GoogleFonts.sourceSansPro(
          fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: GoogleFonts.sourceSansPro(
          fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      caption: GoogleFonts.sourceSansPro(
          fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      overline: GoogleFonts.sourceSansPro(
          fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ).apply(bodyColor: Colors.black87, displayColor: Colors.black87);

    return MaterialApp(
      title: 'Excess Rewards',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: colorScheme,
        primaryColor: colorScheme.primary,
        accentColor: colorScheme.secondary,
        backgroundColor: colorScheme.background,
        textTheme: textTheme,
        primaryTextTheme: textTheme.apply(
            decorationColor: Colors.white,
            bodyColor: Colors.white,
            displayColor: Colors.white),
        accentTextTheme: textTheme.apply(
            bodyColor: colorScheme.secondary,
            displayColor: colorScheme.secondary),
        buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            colorScheme: colorScheme,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        floatingActionButtonTheme: FloatingActionButtonThemeData(),
        dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        cardTheme: CardTheme(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shadowColor: colorScheme.secondary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        primarySwatch: Colors.blue,
//        canvasColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
