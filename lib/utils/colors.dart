import 'package:flutter/material.dart';

class AppColors{
  //primary colors
  static Color kBgColor = Color(0xff202326);
  static Color kFabColor = Color.fromARGB(255, 204, 17, 237);
  static Color kCardColor = Color(0xff2F3235);
  static Color kWhiteColor = Colors.white;

  //gradient colors
  static int gradientStart = 0XFF01F0FF;
  static int gradientEnd = 0XFF4441ED;

  LinearGradient kPrimaryGradient = LinearGradient(colors: [
    Color(gradientStart),
    Color(gradientEnd),
  ],
  
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  );
}