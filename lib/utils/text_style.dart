import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:note/utils/colors.dart';

class AppTextStyles{

  //title style
  static TextStyle appTitle = TextStyle(
    fontSize: 28,
    color: AppColors.kWhiteColor,
    fontWeight: FontWeight.bold,
  );
  
  //subtitle style
  static TextStyle appSubTitle = TextStyle(
    fontSize: 24,
    color: AppColors.kWhiteColor,
    fontWeight: FontWeight.w500,
  );

  //description large style
  static TextStyle appDescriptionStyle = TextStyle(
    fontSize: 14,
    color: AppColors.kWhiteColor,
    fontWeight: FontWeight.w400,
  );


  //description small style
  static TextStyle appDescriptionSmallStyle = TextStyle(
    fontSize: 14,
    color: AppColors.kWhiteColor,
    fontWeight: FontWeight.w400,
  );

//app Body Style
  static TextStyle appBody = TextStyle(
    fontSize: 16,
    color: AppColors.kWhiteColor,
    
  );

//app button style
  static TextStyle appButton = TextStyle(
    fontSize: 16,
    color: AppColors.kWhiteColor,
    fontWeight: FontWeight.bold,
  );
}