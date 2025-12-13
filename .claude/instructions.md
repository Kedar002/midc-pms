# Project Development Instructions

## Target Audience
**Primary Users**: Non-technical users who prefer simple, intuitive interfaces

### UX Principles for Non-Technical Users
- **Simplicity First**: Clean, uncluttered interface with clear purpose
- **Intuitive Design**: Users should understand what to do without instructions
- **Clear Feedback**: Every action shows immediate, obvious response
- **Forgiving Design**: Easy to undo mistakes, hard to break things
- **Minimal Cognitive Load**: Progressive disclosure, show only what's needed
- **Familiar Patterns**: Use conventional UI patterns that users recognize

## Technology Stack
**Framework**: Flutter
**Language**: Dart
**State Management**: BLoC (flutter_bloc)
**Target Platforms**: iOS, Android, Web

## UI Design Standards (Claude.ai Inspired)

### Color Theme: "Monochrome Professional"
**Rationale**: Clean, modern, professional - exactly like Claude's interface
````dart
// lib/theme/app_colors.dart
class AppColors {
  // Primary Palette - Monochrome like Claude
  static const Color background = Color(0xFFFFFFFF);              // Pure white background
  static const Color surface = Color(0xFFFAFAFA);                 // Very light gray for cards
  static const Color surfaceVariant = Color(0xFFF5F5F5);          // Slightly darker surface
  
  // Text Colors - High contrast black/gray
  static const Color textPrimary = Color(0xFF0A0A0A);             // Almost black - main text
  static const Color textSecondary = Color(0xFF525252);           // Medium gray - secondary text
  static const Color textTertiary = Color(0xFF737373);            // Light gray - hints/labels
  
  // Border Colors
  static const Color border = Color(0xFFE5E5E5);                  // Light border
  static const Color borderStrong = Color(0xFFD4D4D4);            // Medium border
  static const Color borderFocus = Color(0xFF0A0A0A);             // Black border on focus
  
  // Action Colors - Minimal, clean accents
  static const Color primary = Color(0xFF0A0A0A);                 // Black for primary actions
  static const Color primaryHover = Color(0xFF262626);            // Dark gray on hover
  static const Color secondary = Color(0xFFFFFFFF);               // White for secondary
  static const Color secondaryHover = Color(0xFFF5F5F5);          // Light gray on hover
  
  // Semantic Colors - Subtle, not loud
  static const Color success = Color(0xFF16A34A);                 // Green for success
  static const Color successBg = Color(0xFFF0FDF4);               // Light green background
  static const Color error = Color(0xFFDC2626);                   // Red for errors
  static const Color errorBg = Color(0xFFFEF2F2);                 // Light red background
  static const Color warning = Color(0xFFEA580C);                 // Orange for warnings
  static const Color warningBg = Color(0xFFFFF7ED);               // Light orange background
  static const Color info = Color(0xFF0284C7);                    // Blue for info
  static const Color infoBg = Color(0xFFF0F9FF);                  // Light blue background
  
  // Interactive States
  static const Color hover = Color(0xFFF5F5F5);                   // Subtle hover state
  static const Color pressed = Color(0xFFE5E5E5);                 // Subtle pressed state
  static const Color disabled = Color(0xFFA3A3A3);                // Disabled state
  static const Color disabledBg = Color(0xFFFAFAFA);              // Disabled background
}
````

### Typography (Claude.ai Style)
````dart
// lib/theme/app_text_styles.dart
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Font Sizes - Clean hierarchy
  static const double fontSize2xs = 12.0;
  static const double fontSizeXs = 13.0;
  static const double fontSizeSm = 14.0;
  static const double fontSizeBase = 15.0;           // Default body text
  static const double fontSizeLg = 16.0;
  static const double fontSizeXl = 18.0;
  static const double fontSize2xl = 20.0;
  static const double fontSize3xl = 24.0;
  static const double fontSize4xl = 30.0;
  static const double fontSize5xl = 36.0;
  
  // Line Heights
  static const double lineHeightTight = 1.25;
  static const double lineHeightNormal = 1.5;
  static const double lineHeightRelaxed = 1.625;
  static const double lineHeightLoose = 1.75;
  
  // Font Family - System fonts like Claude
  static const String fontFamily = '-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif';
  
  // Text Styles
  static TextStyle get heading1 => const TextStyle(
    fontSize: fontSize5xl,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: lineHeightTight,
    letterSpacing: -0.5,
  );
  
  static TextStyle get heading2 => const TextStyle(
    fontSize: fontSize4xl,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: lineHeightTight,
    letterSpacing: -0.3,
  );
  
  static TextStyle get heading3 => const TextStyle(
    fontSize: fontSize3xl,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: lineHeightNormal,
  );
  
  static TextStyle get heading4 => const TextStyle(
    fontSize: fontSize2xl,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: lineHeightNormal,
  );
  
  static TextStyle get heading5 => const TextStyle(
    fontSize: fontSizeXl,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: lineHeightNormal,
  );
  
  static TextStyle get bodyLarge => const TextStyle(
    fontSize: fontSizeLg,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: lineHeightNormal,
  );
  
  static TextStyle get bodyRegular => const TextStyle(
    fontSize: fontSizeBase,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: lineHeightNormal,
  );
  
  static TextStyle get bodySmall => const TextStyle(
    fontSize: fontSizeSm,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: lineHeightNormal,
  );
  
  static TextStyle get labelLarge => const TextStyle(
    fontSize: fontSizeLg,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: lineHeightNormal,
  );
  
  static TextStyle get labelRegular => const TextStyle(
    fontSize: fontSizeBase,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: lineHeightNormal,
  );
  
  static TextStyle get labelSmall => const TextStyle(
    fontSize: fontSizeSm,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: lineHeightNormal,
  );
  
  static TextStyle get captionRegular => const TextStyle(
    fontSize: fontSizeSm,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: lineHeightNormal,
  );
  
  static TextStyle get captionSmall => const TextStyle(
    fontSize: fontSizeXs,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: lineHeightNormal,
  );
  
  static TextStyle get button => const TextStyle(
    fontSize: fontSizeBase,
    fontWeight: FontWeight.w500,
    height: lineHeightNormal,
    letterSpacing: 0.2,
  );
  
  static TextStyle get code => const TextStyle(
    fontSize: fontSizeSm,
    fontWeight: FontWeight.w400,
    fontFamily: 'monospace',
    color: AppColors.textPrimary,
    height: lineHeightRelaxed,
  );
}
````

### Spacing & Sizing (Claude.ai Precision)
````dart
// lib/theme/app_spacing.dart
class AppSpacing {
  // Spacing Scale - 4px base (Claude uses very precise spacing)
  static const double space0 = 0.0;
  static const double space1 = 4.0;
  static const double space2 = 8.0;
  static const double space3 = 12.0;
  static const double space4 = 16.0;
  static const double space5 = 20.0;
  static const double space6 = 24.0;
  static const double space7 = 28.0;
  static const double space8 = 32.0;
  static const double space10 = 40.0;
  static const double space12 = 48.0;
  static const double space16 = 64.0;
  static const double space20 = 80.0;
  static const double space24 = 96.0;
  
  // Component Heights - Clean, consistent
  static const double buttonHeight = 40.0;            // Standard button height
  static const double buttonHeightSmall = 32.0;       // Small button
  static const double buttonHeightLarge = 48.0;       // Large button
  static const double inputHeight = 40.0;             // Standard input
  static const double inputHeightLarge = 48.0;        // Large input
  
  // Border Radius - Subtle, like Claude
  static const double radiusNone = 0.0;
  static const double radiusSmall = 4.0;
  static const double radiusMedium = 6.0;
  static const double radiusLarge = 8.0;
  static const double radiusXLarge = 12.0;
  static const double radiusFull = 9999.0;
  
  // Container Widths
  static const double containerSm = 640.0;
  static const double containerMd = 768.0;
  static const double containerLg = 1024.0;
  static const double containerXl = 1280.0;
  static const double container2xl = 1536.0;
  
  // Icon Sizes
  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 20.0;
  static const double iconSizeLarge = 24.0;
  static const double iconSizeXLarge = 32.0;
  
  // Elevation (shadows) - Very subtle like Claude
  static const double elevation0 = 0.0;
  static const double elevation1 = 1.0;
  static const double elevation2 = 2.0;
  static const double elevation3 = 4.0;
}
````

### Flutter Theme Configuration
````dart
// lib/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'app_spacing.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      
      // Color Scheme
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.textSecondary,
        error: AppColors.error,
        background: AppColors.background,
        surface: AppColors.surface,
        onPrimary: Colors.white,
        onSecondary: AppColors.textPrimary,
        onError: Colors.white,
        onBackground: AppColors.textPrimary,
        onSurface: AppColors.textPrimary,
      ),
      
      // Typography
      fontFamily: 'SF Pro Display', // Falls back to system font
      textTheme: TextTheme(
        displayLarge: AppTextStyles.heading1,
        displayMedium: AppTextStyles.heading2,
        displaySmall: AppTextStyles.heading3,
        headlineMedium: AppTextStyles.heading4,
        headlineSmall: AppTextStyles.heading5,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyRegular,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.labelLarge,
        labelMedium: AppTextStyles.labelRegular,
        labelSmall: AppTextStyles.labelSmall,
      ),
      
      // App Bar Theme - Clean like Claude
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextStyles.heading5,
        iconTheme: const IconThemeData(
          color: AppColors.textPrimary,
          size: AppSpacing.iconSizeLarge,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        surfaceTintColor: Colors.transparent,
      ),
      
      // Elevated Button Theme - Black buttons like Claude
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(0, AppSpacing.buttonHeight),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          textStyle: AppTextStyles.button,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.space4,
            vertical: AppSpacing.space2,
          ),
        ).copyWith(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.disabledBg;
            }
            if (states.contains(MaterialState.pressed)) {
              return AppColors.pressed;
            }
            if (states.contains(MaterialState.hovered)) {
              return AppColors.primaryHover;
            }
            return AppColors.primary;
          }),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.disabled;
            }
            return Colors.white;
          }),
        ),
      ),
      
      // Outlined Button Theme - White with border like Claude
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, AppSpacing.buttonHeight),
          foregroundColor: AppColors.textPrimary,
          textStyle: AppTextStyles.button,
          side: const BorderSide(
            color: AppColors.border,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.space4,
            vertical: AppSpacing.space2,
          ),
        ).copyWith(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.disabledBg;
            }
            if (states.contains(MaterialState.pressed)) {
              return AppColors.pressed;
            }
            if (states.contains(MaterialState.hovered)) {
              return AppColors.hover;
            }
            return Colors.white;
          }),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.disabled;
            }
            return AppColors.textPrimary;
          }),
          side: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.focused)) {
              return const BorderSide(color: AppColors.borderFocus, width: 1.5);
            }
            return const BorderSide(color: AppColors.border, width: 1);
          }),
        ),
      ),
      
      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          textStyle: AppTextStyles.button,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.space3,
            vertical: AppSpacing.space2,
          ),
        ).copyWith(
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.disabled;
            }
            return AppColors.textPrimary;
          }),
        ),
      ),
      
      // Input Decoration Theme - Clean, minimal borders
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.background,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.space3,
          vertical: AppSpacing.space3,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          borderSide: const BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          borderSide: const BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          borderSide: const BorderSide(
            color: AppColors.borderFocus,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          borderSide: const BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
        hintStyle: TextStyle(
          color: AppColors.textTertiary,
          fontSize: AppTextStyles.fontSizeBase,
        ),
        labelStyle: TextStyle(
          color: AppColors.textSecondary,
          fontSize: AppTextStyles.fontSizeBase,
        ),
        errorStyle: TextStyle(
          color: AppColors.error,
          fontSize: AppTextStyles.fontSizeSm,
        ),
      ),
      
      // Card Theme - Subtle borders like Claude
      cardTheme: CardTheme(
        color: AppColors.background,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
          side: const BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
        margin: EdgeInsets.zero,
      ),
      
      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
        space: 1,
      ),
      
      // Icon Theme
      iconTheme: const IconThemeData(
        color: AppColors.textPrimary,
        size: AppSpacing.iconSizeMedium,
      ),
      
      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surface,
        deleteIconColor: AppColors.textSecondary,
        disabledColor: AppColors.disabledBg,
        selectedColor: AppColors.primary,
        secondarySelectedColor: AppColors.surface,
        labelPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.space2),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.space3,
          vertical: AppSpacing.space1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          side: const BorderSide(color: AppColors.border),
        ),
        labelStyle: AppTextStyles.bodySmall,
        secondaryLabelStyle: AppTextStyles.bodySmall,
        brightness: Brightness.light,
      ),
      
      // Dialog Theme
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.background,
        elevation: AppSpacing.elevation3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        ),
        titleTextStyle: AppTextStyles.heading4,
        contentTextStyle: AppTextStyles.bodyRegular,
      ),
      
      // Snackbar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.textPrimary,
        contentTextStyle: AppTextStyles.bodyRegular.copyWith(color: Colors.white),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
        ),
      ),
      
      // Bottom Sheet Theme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.background,
        elevation: AppSpacing.elevation3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSpacing.radiusXLarge),
          ),
        ),
      ),
    );
  }
}
````

### Reusable Widget Components
````dart
// lib/widgets/primary_button.dart
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isFullWidth;
  final IconData? icon;
  final bool isSmall;

  const PrimaryButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.isFullWidth = false,
    this.icon,
    this.isSmall = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget button = ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: isSmall
          ? ElevatedButton.styleFrom(
              minimumSize: const Size(0, 32),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            )
          : null,
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 20),
                  const SizedBox(width: 8),
                ],
                Text(label),
              ],
            ),
    );

    return isFullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}

// lib/widgets/secondary_button.dart
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isFullWidth;
  final IconData? icon;
  final bool isSmall;

  const SecondaryButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.isFullWidth = false,
    this.icon,
    this.isSmall = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget button = OutlinedButton(
      onPressed: onPressed,
      style: isSmall
          ? OutlinedButton.styleFrom(
              minimumSize: const Size(0, 32),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            )
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 20),
            const SizedBox(width: 8),
          ],
          Text(label),
        ],
      ),
    );

    return isFullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}

// lib/widgets/app_text_field.dart
import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_spacing.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final String? errorText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final ValueChanged<String>? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final bool enabled;

  const AppTextField({
    Key? key,
    this.label,
    this.hint,
    this.controller,
    this.errorText,
    this.obscureText = false,
    this.keyboardType,
    this.maxLines = 1,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(label!, style: AppTextStyles.labelRegular),
          const SizedBox(height: AppSpacing.space2),
        ],
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLines: maxLines,
          onChanged: onChanged,
          enabled: enabled,
          decoration: InputDecoration(
            hintText: hint,
            errorText: errorText,
            prefixIcon: prefix,
            suffixIcon: suffix,
          ),
        ),
      ],
    );
  }
}

// lib/widgets/app_card.dart
import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

class AppCard extends StatelessWidget {
  final String? title;
  final Widget child;
  final EdgeInsets? padding;
  final VoidCallback? onTap;

  const AppCard({
    Key? key,
    this.title,
    required this.child,
    this.padding,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget cardContent = Padding(
      padding: padding ?? const EdgeInsets.all(AppSpacing.space4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            Text(title!, style: AppTextStyles.heading5),
            const SizedBox(height: AppSpacing.space3),
          ],
          child,
        ],
      ),
    );

    if (onTap != null) {
      return Card(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
          child: cardContent,
        ),
      );
    }

    return Card(child: cardContent);
  }
}

// lib/widgets/message_banner.dart
import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_colors.dart';

enum MessageType { success, error, warning, info }

class MessageBanner extends StatelessWidget {
  final String message;
  final MessageType type;
  final VoidCallback? onDismiss;

  const MessageBanner({
    Key? key,
    required this.message,
    required this.type,
    this.onDismiss,
  }) : super(key: key);

  Color get backgroundColor {
    switch (type) {
      case MessageType.success:
        return AppColors.successBg;
      case MessageType.error:
        return AppColors.errorBg;
      case MessageType.warning:
        return AppColors.warningBg;
      case MessageType.info:
        return AppColors.infoBg;
    }
  }

  Color get borderColor {
    switch (type) {
      case MessageType.success:
        return AppColors.success;
      case MessageType.error:
        return AppColors.error;
      case MessageType.warning:
        return AppColors.warning;
      case MessageType.info:
        return AppColors.info;
    }
  }

  Color get iconColor => borderColor;

  IconData get icon {
    switch (type) {
      case MessageType.success:
        return Icons.check_circle_outline;
      case MessageType.error:
        return Icons.error_outline;
      case MessageType.warning:
        return Icons.warning_amber_outlined;
      case MessageType.info:
        return Icons.info_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.space3),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
        border: Border.all(color: borderColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: AppSpacing.iconSizeMedium),
          const SizedBox(width: AppSpacing.space2),
          Expanded(
            child: Text(
              message,
              style: AppTextStyles.bodyRegular.copyWith(color: iconColor),
            ),
          ),
          if (onDismiss != null) ...[
            const SizedBox(width: AppSpacing.space2),
            IconButton(
              icon: const Icon(Icons.close),
              iconSize: AppSpacing.iconSizeMedium,
              color: iconColor,
              onPressed: onDismiss,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ],
      ),
    );
  }
}

// lib/widgets/loading_indicator.dart
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class LoadingIndicator extends StatelessWidget {
  final double? size;
  final Color? color;

  const LoadingIndicator({
    Key? key,
    this.size,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size ?? 24,
        height: size ?? 24,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            color ?? AppColors.primary,
          ),
        ),
      ),
    );
  }
}

// lib/widgets/empty_state.dart
import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_colors.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? description;
  final Widget? action;

  const EmptyState({
    Key? key,
    required this.icon,
    required this.title,
    this.description,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.space6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64,
              color: AppColors.textTertiary,
            ),
            const SizedBox(height: AppSpacing.space4),
            Text(
              title,
              style: AppTextStyles.heading4.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            if (description != null) ...[
              const SizedBox(height: AppSpacing.space2),
              Text(
                description!,
                style: AppTextStyles.bodyRegular.copyWith(
                  color: AppColors.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (action != null) ...[
              const SizedBox(height: AppSpacing.space6),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
````

### Screen Layout Templates
````dart
// lib/widgets/app_scaffold.dart
import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';

class AppScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const AppScaffold({
    Key? key,
    this.title,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.actions,
    this.showBackButton = true,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null
          ? AppBar(
              title: Text(title!),
              actions: actions,
              leading: showBackButton
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
                    )
                  : null,
            )
          : null,
      body: SafeArea(child: body),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

// lib/widgets/responsive_layout.dart
import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final EdgeInsets? padding;

  const ResponsiveLayout({
    Key? key,
    required this.child,
    this.maxWidth = AppSpacing.containerLg,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(AppSpacing.space4),
          child: child,
        ),
      ),
    );
  }
}
````

## BLoC Architecture Setup

### Project Structure
````
lib/
├── main.dart
├── app.dart
├── theme/
│   ├── app_theme.dart
│   ├── app_colors.dart
│   ├── app_text_styles.dart
│   └── app_spacing.dart
├── widgets/
│   ├── primary_button.dart
│   ├── secondary_button.dart
│   ├── app_text_field.dart
│   ├── app_card.dart
│   ├── message_banner.dart
│   ├── loading_indicator.dart
│   ├── empty_state.dart
│   ├── app_scaffold.dart
│   └── responsive_layout.dart
├── features/
│   └── feature_name/
│       ├── presentation/
│       │   ├── bloc/
│       │   │   ├── feature_bloc.dart
│       │   │   ├── feature_event.dart
│       │   │   └── feature_state.dart
│       │   ├── pages/
│       │   │   └── feature_page.dart
│       │   └── widgets/
│       │       └── feature_widgets.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   └── entity.dart
│       │   ├── repositories/
│       │   │   └── feature_repository.dart
│       │   └── usecases/
│       │       └── usecase.dart
│       └── data/
│           ├── models/
│           │   └── model.dart
│           ├── repositories/
│           │   └── feature_repository_impl.dart
│           └── datasources/
│               ├── local_data_source.dart
│               └── remote_data_source.dart
├── core/
│   ├── error/
│   │   └── failures.dart
│   ├── network/
│   │   └── network_info.dart
│   └── utils/
│       └── constants.dart
└── injection_container.dart
````

### BLoC Example Template
````dart
// lib/features/example/presentation/bloc/example_event.dart
import 'package:equatable/equatable.dart';

abstract class ExampleEvent extends Equatable {
  const ExampleEvent();

  @override
  List<Object?> get props => [];
}

class LoadExample extends ExampleEvent {}

class SubmitExample extends ExampleEvent {
  final String data;

  const SubmitExample(this.data);

  @override
  List<Object?> get props => [data];
}

// lib/features/example/presentation/bloc/example_state.dart
import 'package:equatable/equatable.dart';

abstract class ExampleState extends Equatable {
  const ExampleState();

  @override
  List<Object?> get props => [];
}

class ExampleInitial extends ExampleState {}

class ExampleLoading extends ExampleState {}

class ExampleLoaded extends ExampleState {
  final dynamic data;

  const ExampleLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class ExampleError extends ExampleState {
  final String message;

  const ExampleError(this.message);

  @override
  List<Object?> get props => [message];
}

// lib/features/example/presentation/bloc/example_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'example_event.dart';
import 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleInitial()) {
    on<LoadExample>(_onLoadExample);
    on<SubmitExample>(_onSubmitExample);
  }

  Future<void> _onLoadExample(
    LoadExample event,
    Emitter<ExampleState> emit,
  ) async {
    emit(ExampleLoading());
    try {
      // Load data logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const ExampleLoaded('Sample Data'));
    } catch (e) {
      emit(ExampleError(e.toString()));
    }
  }

  Future<void> _onSubmitExample(
    SubmitExample event,
    Emitter<ExampleState> emit,
  ) async {
    emit(ExampleLoading());
    try {
      // Submit data logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(ExampleLoaded(event.data));
    } catch (e) {
      emit(ExampleError(e.toString()));
    }
  }
}

// lib/features/example/presentation/pages/example_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widgets/app_scaffold.dart';
import '../../../../widgets/responsive_layout.dart';
import '../../../../widgets/primary_button.dart';
import '../../../../widgets/message_banner.dart';
import '../../../../widgets/loading_indicator.dart';
import '../../../../theme/app_spacing.dart';
import '../bloc/example_bloc.dart';
import '../bloc/example_event.dart';
import '../bloc/example_state.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExampleBloc()..add(LoadExample()),
      child: const ExampleView(),
    );
  }
}

class ExampleView extends StatelessWidget {
  const ExampleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Example Page',
      body: ResponsiveLayout(
        child: BlocBuilder<ExampleBloc, ExampleState>(
          builder: (context, state) {
            if (state is ExampleLoading) {
              return const LoadingIndicator();
            }

            if (state is ExampleError) {
              return Column(
                children: [
                  MessageBanner(
                    message: state.message,
                    type: MessageType.error,
                  ),
                  const SizedBox(height: AppSpacing.space4),
                  PrimaryButton(
                    label: 'Retry',
                    onPressed: () {
                      context.read<ExampleBloc>().add(LoadExample());
                    },
                  ),
                ],
              );
            }

            if (state is ExampleLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MessageBanner(
                    message: 'Data loaded successfully!',
                    type: MessageType.success,
                  ),
                  const SizedBox(height: AppSpacing.space4),
                  Text('Data: ${state.data}'),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
````

## Code Quality Standards

### Best Practices:

1. **Clean Architecture with BLoC**:
   - Separate presentation, domain, and data layers
   - Use dependency injection
   - Single responsibility principle

2. **Naming Conventions**:
   - Classes: PascalCase
   - Files: snake_case
   - Variables/functions: camelCase
   - Constants: SCREAMING_SNAKE_CASE

3. **Error Handling**:
   - Always use try-catch for async operations
   - Provide user-friendly error messages
   - Log errors for debugging

4. **Performance**:
   - Use const constructors
   - Avoid unnecessary rebuilds
   - Use ListView.builder for lists
   - Lazy load data when possible

5. **Accessibility**:
   - Semantic labels
   - Sufficient color contrast
   - Keyboard navigation support

## Project Documentation System

### IMPORTANT: Maintain PROJECT_LOG.md

Every action must be logged in `PROJECT_LOG.md` in the project root.

**File Structure:**
````markdown
# Project Log

## Project Overview
[Brief description of the Flutter application]

## Tech Stack
- Framework: Flutter
- Language: Dart
- State Management: BLoC (flutter_bloc)
- Architecture: Clean Architecture
- Target Platforms: iOS, Android, Web

---

## Changelog

### [2024-12-14 15:30] - Initial Project Setup
**What**: Created new Flutter project with Claude-inspired theme
**Why**: Starting development with clean, professional UI

**Files Created**:
- `lib/theme/app_theme.dart` - Main theme configuration
- `lib/theme/app_colors.dart` - Monochrome color palette
- `lib/theme/app_text_styles.dart` - Typography system
- `lib/theme/app_spacing.dart` - Spacing constants

**Details**:
- Implemented black/white/gray color scheme
- Created clean, minimal component styles
- Set up responsive layout system

**Status**: ✅ Complete

**Next Steps**:
- Create feature modules
- Set up BLoC architecture

---

### [YYYY-MM-DD HH:MM] - Next Action...
````

### Log Entry Template
````markdown
### [2024-12-14 16:45] - Created Authentication Feature
**What**: Built authentication flow with login/register
**Why**: User authentication required for app

**Files Created/Modified**:
- `lib/features/auth/presentation/bloc/auth_bloc.dart` - Auth BLoC
- `lib/features/auth/presentation/pages/login_page.dart` - Login UI
- `lib/features/auth/domain/repositories/auth_repository.dart` - Auth interface
- `lib/features/auth/data/repositories/auth_repository_impl.dart` - Auth implementation

**Details**:
- Implemented email/password login
- Added form validation
- Created loading states
- Added error handling with user-friendly messages

**Dependencies Added**:
```yaml
dependencies:
  flutter_bloc: ^8.1.3
  equatable: ^2.0.5
```

**Status**: ✅ Complete

**Next Steps**:
- Add password reset
- Implement biometric auth
````

## Execution Protocol

### Before ANY Code Execution:
1. **Explain** what will be done
2. **List** files that will be created/modified
3. **Update** PROJECT_LOG.md with planned action
4. **Execute** the code
5. **Update** PROJECT_LOG.md with results

### After Completion:
1. Verify code follows Flutter best practices
2. Ensure BLoC pattern is correctly implemented
3. Check UI matches Claude-style design
4. Update PROJECT_LOG.md with final status
5. Suggest next steps

## Quick Reference Checklist

### Design Checklist:
- [ ] Monochrome color scheme (black/white/gray)
- [ ] Clean, minimal layout
- [ ] Subtle borders and shadows
- [ ] Proper typography hierarchy
- [ ] Responsive layout
- [ ] Consistent spacing (4px grid)

### Code Checklist:
- [ ] BLoC pattern implemented correctly
- [ ] Clean architecture layers separated
- [ ] Error handling in place
- [ ] Loading states shown
- [ ] User-friendly error messages
- [ ] PROJECT_LOG.md updated
- [ ] Code commented where needed
- [ ] No hardcoded values (use theme constants)

### BLoC Checklist:
- [ ] Events defined clearly
- [ ] States cover all scenarios (initial, loading, loaded, error)
- [ ] Bloc logic separated from UI
- [ ] Proper dependency injection
- [ ] Repository pattern used

---

Remember: The goal is to create a clean, professional interface inspired by Claude's website - minimal, intuitive, and easy to use for non-technical users.