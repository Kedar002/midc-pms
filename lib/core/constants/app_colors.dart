import 'package:flutter/material.dart';

/// Claude.ai inspired monochrome color palette
///
/// This color scheme provides a clean, professional aesthetic using
/// only black, white, and shades of gray for the spreadsheet application.
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // Background colors
  static const Color background = Color(0xFFFFFFFF); // Pure white
  static const Color surface = Color(0xFFFAFAFA); // Off-white
  static const Color surfaceVariant = Color(0xFFF5F5F5); // Light gray

  // Border colors
  static const Color border = Color(0xFFE0E0E0); // Light gray border
  static const Color borderStrong = Color(0xFFBDBDBD); // Medium gray border

  // Text colors
  static const Color textPrimary = Color(0xFF212121); // Near black
  static const Color textSecondary = Color(0xFF757575); // Medium gray
  static const Color textTertiary = Color(0xFF9E9E9E); // Light gray

  // Grid colors
  static const Color cellBackground = Color(0xFFFFFFFF); // White
  static const Color cellBorder = Color(0xFFE8E8E8); // Very light gray
  static const Color headerBackground = Color(0xFFF8F8F8); // Off-white
  static const Color headerText = Color(0xFF424242); // Dark gray

  // Selection colors
  static const Color selectedCell = Color(0xFFEEEEEE); // Light gray highlight
  static const Color selectionBorder = Color(0xFF000000); // Black border

  // Editing colors
  static const Color editingCell = Color(0xFFFFFFFF); // White
  static const Color editingBorder = Color(0xFF000000); // Black border

  // Resizer colors
  static const Color resizerLine = Color(0xFFBDBDBD); // Medium gray
  static const Color resizerActive = Color(0xFF9E9E9E); // Active gray

  // Interactive elements
  static const Color buttonBackground = Color(0xFFF5F5F5); // Light gray
  static const Color buttonHover = Color(0xFFE0E0E0); // Hover gray
  static const Color buttonText = Color(0xFF212121); // Near black

  // Status colors (subtle, staying monochrome)
  static const Color error = Color(0xFF424242); // Dark gray (subtle)
  static const Color success = Color(0xFF616161); // Medium-dark gray

  // Scrollbar
  static const Color scrollbarThumb = Color(0xFFBDBDBD); // Medium gray
  static const Color scrollbarTrack = Color(0xFFF5F5F5); // Light gray
}
