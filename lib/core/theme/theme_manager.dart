import 'package:flutter/material.dart';

// class ThemeManager {
//   static final ThemeManager _instance = ThemeManager._init();
//   static ThemeManager get instance => _instance;

//   ThemeManager._init();

//   final ThemeData darkTheme = ThemeData.dark().copyWith(
//     typography: Typography.material2021(),
//     scaffoldBackgroundColor: Colors.black,
//     focusColor: Colors.red,
//     disabledColor: Colors.grey,
//     appBarTheme: const AppBarTheme(
//       elevation: 0,
//       centerTitle: true,
//       backgroundColor: Colors.transparent,
//     ),
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       backgroundColor: Colors.black,
//       selectedItemColor: Colors.red,
//       unselectedItemColor: Colors.grey,
//     ),
//   );
// }

class ThemeManager {
  final ThemeData darkTheme = ThemeData.dark().copyWith(
    typography: Typography.material2021(),
    scaffoldBackgroundColor: Colors.black,
    focusColor: Colors.red,
    disabledColor: Colors.grey,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
    ),
  );
}
