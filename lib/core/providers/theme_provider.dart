import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData get currentTheme {
    return _isDarkMode ? _darkTheme : _lightTheme;
  }

  static final ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightScaffoldBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightAppBarBackground,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.lightIconColor),
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
  );

  static final ThemeData _darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkAppBarBackground,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.darkIconColor),
    ),
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
  );
}
