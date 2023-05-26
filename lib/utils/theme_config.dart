import 'package:flutter/material.dart';
import 'package:kooho_test/utils/colors.dart';

class ThemeConfig {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black1A,
    fontFamily: "Satoshi",
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black1A,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontFamily: "Satoshi",
        color: AppColors.whiteFF,
      ),
    ),
    dividerTheme: DividerThemeData(color: AppColors.black33, thickness: 1.1),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.black1A,
      selectedItemColor: AppColors.whiteFF,
      unselectedItemColor: AppColors.grey66,
      selectedIconTheme: IconThemeData(color: AppColors.whiteFF),
      unselectedIconTheme: IconThemeData(color: AppColors.grey66),
      //   elevation: 1,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(color: AppColors.whiteFF, fontSize: 12),
      unselectedLabelStyle: TextStyle(color: AppColors.grey66, fontSize: 12),
    ),
  );
}
