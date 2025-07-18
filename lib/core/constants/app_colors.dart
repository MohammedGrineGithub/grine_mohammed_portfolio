import 'package:flutter/material.dart';

class AppColors {
  static Color? primaryColor = Colors.blue[900];

  // Light Theme Colors
  static const Color lightScaffoldBackground = Colors.white;
  static const Color lightAppBarBackground = Colors.white;
  static const Color lightIconColor = Colors.black;

  // Dark Theme Colors
  static const Color darkScaffoldBackground = Color(0xFF0A0A0A);
  static const Color darkAppBarBackground = Color(0xFF0A0A0A);
  static const Color darkIconColor = Colors.white;

  // Common Colors
  static const Color grey600 = Color(0xFF757575);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey900 = Color(0xFF212121);

  // Skill Chip Colors
  static Color skillChipBackground = Colors.blue.withValues(alpha: 0.1);
  static Color skillChipBorder = Colors.blue.withValues(alpha: 0.3);

  // Shadow Colors
  static Color shadowColor = Colors.black.withValues(alpha: 0.1);
  static Color blueShadowColor = Colors.blue.withValues(alpha: 0.3);

  // Project Card Colors
  static const Color orange = Colors.orange;
  static const Color red = Colors.red;
  static const Color green = Colors.green;
  static const Color purple = Colors.purple;
  static const Color brown = Colors.brown;

  static Color primaryColorOf(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? Colors.blue : Colors.blue[900]!;
  }
  static Color whiteColorOf(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? Colors.white : Colors.black;
  }
}
