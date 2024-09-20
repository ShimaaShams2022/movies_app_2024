


import 'package:flutter/material.dart';

class MyThemeData{

  static const Color darkSecondary =Color(0xFFF7B539);
  static const Color darkPrimary = Color(0xFFFFBB3B);
  static const Color textPrimaryColor = Colors.white;
  static const Color colorDivider=Color(0xFF707070);
  static const Color iconColorBasic=Color(0xFFC6C6C6);




  static final ThemeData darkTheme= ThemeData(

    dividerColor:colorDivider,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          fontFamily:'Intel' ,
          color: textPrimaryColor
      ),
      titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          fontFamily: 'Intel',
          color:textPrimaryColor
      ),
      titleSmall: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          fontFamily: 'Intel',
          color:textPrimaryColor
      ),
      bodyLarge:TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'Intel',
          color: textPrimaryColor
      ),
      bodyMedium:TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          fontFamily: 'Intel',
          color: textPrimaryColor
      ),

    ),

    cardTheme: const CardTheme(
      color: textPrimaryColor,
      surfaceTintColor:null ,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedLabelStyle:TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.w400,
            fontFamily: 'Intel',
            color: textPrimaryColor
        ),
        backgroundColor: darkPrimary,
        selectedItemColor:  darkPrimary,
        unselectedItemColor: iconColorBasic,
    ),

    scaffoldBackgroundColor: Colors.transparent,

  );

}
