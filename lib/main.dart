// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/providers/theme_provider.dart';
import 'widgets/portfolio_website.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'GRINE Mohammed - Portfolio',
            theme: themeProvider.currentTheme,
            home: PortfolioWebsite(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
