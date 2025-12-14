import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_strings.dart';
import 'features/spreadsheet/presentation/pages/spreadsheet_page.dart';

/// Root application widget
///
/// Sets up the MaterialApp with theme configuration and routing.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SpreadsheetPage(),
    );
  }
}
