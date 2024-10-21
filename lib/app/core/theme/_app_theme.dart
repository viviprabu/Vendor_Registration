// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '_app_colors.dart';

abstract class FinanceAppTheme {
  static const _fontFamily = 'Inter';

  static ThemeData kLightTheme() {
    final _baseTheme = ThemeData.light();
    final _textTheme = _getTextTheme(_baseTheme.textTheme);
    return _baseTheme.copyWith(
      textTheme: _textTheme,
      elevatedButtonTheme: _getElevatedButtonTheme(_textTheme),
      textButtonTheme: _getTextButtonTheme,
      scrollbarTheme: ScrollbarThemeData(
        thumbVisibility: WidgetStateProperty.all<bool?>(true),
        trackVisibility: WidgetStateProperty.all<bool?>(true),
        trackColor: WidgetStateProperty.all<Color?>(
          FinanceAppColors.kNeutral200,
        ),
        thumbColor:
            WidgetStateProperty.all<Color?>(FinanceAppColors.kWhiteColor),
        thickness: WidgetStateProperty.all<double?>(6),
        trackBorderColor: WidgetStateProperty.all<Color?>(Colors.transparent),
        crossAxisMargin: 2,
        mainAxisMargin: 2,
        radius: const Radius.circular(24),
        interactive: true,
      ),
      outlinedButtonTheme: _getOutlineButtonTheme,
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: FinanceAppColors.kPrimary600,
      colorScheme: const ColorScheme.light(
        surface: FinanceAppColors.kPrimary50,
        primary: FinanceAppColors.kPrimary600,
        onPrimary: FinanceAppColors.kWhiteColor,
        secondary: FinanceAppColors.kNeutral200,
        error: FinanceAppColors.kError,
        primaryContainer: FinanceAppColors.kWhiteColor,
        onPrimaryContainer: FinanceAppColors.kNeutral900,
        tertiaryContainer: FinanceAppColors.kNeutral50,
        onTertiaryContainer: FinanceAppColors.kNeutral700,
        onTertiary: FinanceAppColors.kNeutral700,
        outline: FinanceAppColors.kNeutral300,
      ),
      drawerTheme: _baseTheme.drawerTheme.copyWith(
        backgroundColor: FinanceAppColors.kWhiteColor,
      ),
      appBarTheme: _baseTheme.appBarTheme.copyWith(
        backgroundColor: FinanceAppColors.kWhiteColor,
      ),
      inputDecorationTheme: _inputDecorationTheme(
        theme: _baseTheme,
      ),
      dialogTheme: _dialogTheme,
      checkboxTheme: const CheckboxThemeData(
        side: BorderSide(
          width: 1,
          color: FinanceAppColors.kNeutral500,
        ),
      ),
    );
  }

  static ThemeData kDarkTheme() {
    final _baseTheme = ThemeData.dark();
    final _textTheme = _getTextTheme(_baseTheme.textTheme);

    return _baseTheme.copyWith(
      textTheme: _textTheme,
      elevatedButtonTheme: _getElevatedButtonTheme(_textTheme),
      textButtonTheme: _getTextButtonTheme,
      scrollbarTheme: ScrollbarThemeData(
        thumbVisibility: WidgetStateProperty.all<bool?>(true),
        trackVisibility: WidgetStateProperty.all<bool?>(true),
        trackColor: WidgetStateProperty.all<Color?>(
          FinanceAppColors.kDark3,
        ),
        thumbColor: WidgetStateProperty.all<Color?>(FinanceAppColors.kDark2),
        thickness: WidgetStateProperty.all<double?>(6),
        trackBorderColor: WidgetStateProperty.all<Color?>(Colors.transparent),
        crossAxisMargin: 2,
        mainAxisMargin: 2,
        radius: const Radius.circular(24),
        interactive: true,
      ),
      outlinedButtonTheme: _getOutlineButtonTheme,
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: FinanceAppColors.kPrimary600,
      colorScheme: const ColorScheme.dark(
        surface: FinanceAppColors.kDark1,
        primary: FinanceAppColors.kPrimary600,
        error: FinanceAppColors.kError,
        onPrimary: FinanceAppColors.kWhiteColor,
        primaryContainer: FinanceAppColors.kDark2,
        onPrimaryContainer: FinanceAppColors.kWhiteColor,
        secondary: FinanceAppColors.kNeutral200,
        outline: FinanceAppColors.kNeutral600,
        onTertiary: FinanceAppColors.kNeutral200,
        tertiaryContainer: FinanceAppColors.kDark3,
        onTertiaryContainer: FinanceAppColors.kNeutral200,
      ),
      drawerTheme: _baseTheme.drawerTheme.copyWith(
        backgroundColor: FinanceAppColors.kDark2,
      ),
      appBarTheme: _baseTheme.appBarTheme.copyWith(
        backgroundColor: FinanceAppColors.kDark2,
      ),
      inputDecorationTheme: _inputDecorationTheme(
        theme: _baseTheme,
      ),
      dialogTheme: _dialogTheme.copyWith(
        backgroundColor: FinanceAppColors.kDark2,
      ),
      checkboxTheme: const CheckboxThemeData(
        side: BorderSide(
          width: 1,
          color: FinanceAppColors.kNeutral400,
        ),
      ),
    );
  }

  //------------------Button Theme------------------//
  static const _buttonPadding = EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 12,
  );
  static const _buttonDensity = VisualDensity.standard;
  static _getElevatedButtonTheme(TextTheme baseTextTheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: _buttonPadding,
        visualDensity: _buttonDensity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: FinanceAppColors.kPrimary500,
        foregroundColor: FinanceAppColors.kWhiteColor,
        textStyle: baseTextTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static final _getTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: _buttonPadding,
      visualDensity: _buttonDensity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );

  static final _getOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      visualDensity: _buttonDensity,
      padding: _buttonPadding,
      side: const BorderSide(color: FinanceAppColors.kPrimary600),
      foregroundColor: FinanceAppColors.kPrimary600,
    ),
  );

  static InputDecorationTheme _inputDecorationTheme({
    ThemeData? theme,
  }) {
    final _isDark = theme?.brightness == Brightness.dark;

    final baseTextTheme = theme?.textTheme;
    OutlineInputBorder _border({Color? color}) {
      return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(
          width: 1,
          color: color ?? FinanceAppColors.kNeutral300,
        ),
      );
    }

    return InputDecorationTheme(
      contentPadding: const EdgeInsets.fromLTRB(12, 12, 10, 12),
      isDense: true,
      isCollapsed: true,
      //Enabled Border
      enabledBorder:
          _border(color: _isDark ? FinanceAppColors.kNeutral600 : null),

      //Focus Border
      focusedBorder: _border(color: FinanceAppColors.kPrimary600),

      //Error Border
      errorBorder: _border(color: FinanceAppColors.kError),

      //Error Focus Border
      focusedErrorBorder: _border(color: FinanceAppColors.kError),

      // Disabled Border
      disabledBorder: _border(),
      floatingLabelStyle: baseTextTheme?.bodySmall?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      hintStyle: baseTextTheme?.bodySmall?.copyWith(
        fontWeight: FontWeight.normal,
        color: _isDark
            ? FinanceAppColors.kNeutral200
            : FinanceAppColors.kNeutral700,
      ),
    );
  }

  static const _dialogTheme = DialogTheme(
    backgroundColor: FinanceAppColors.kWhiteColor,
  );

  static TextTheme _getTextTheme(TextTheme baseTextTheme) {
    return baseTextTheme.copyWith(
      displayLarge: baseTextTheme.displayLarge?.copyWith(
        fontFamily: _fontFamily,
      ),
      displayMedium: baseTextTheme.displayMedium?.copyWith(
        fontFamily: _fontFamily,
      ),
      displaySmall: baseTextTheme.displaySmall?.copyWith(
        fontFamily: _fontFamily,
      ),
      headlineLarge: baseTextTheme.headlineLarge?.copyWith(
        fontFamily: _fontFamily,
      ),
      headlineMedium: baseTextTheme.headlineMedium?.copyWith(
        fontFamily: _fontFamily,
      ),
      headlineSmall: baseTextTheme.headlineSmall?.copyWith(
        fontFamily: _fontFamily,
      ),
      titleLarge: baseTextTheme.titleLarge?.copyWith(
        fontFamily: _fontFamily,
      ),
      titleMedium: baseTextTheme.titleMedium?.copyWith(
        fontFamily: _fontFamily,
      ),
      titleSmall: baseTextTheme.titleSmall?.copyWith(
        fontFamily: _fontFamily,
      ),
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(
        fontFamily: _fontFamily,
      ),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(
        fontFamily: _fontFamily,
      ),
      bodySmall: baseTextTheme.bodySmall?.copyWith(
        fontFamily: _fontFamily,
      ),
      labelLarge: baseTextTheme.labelLarge?.copyWith(
        fontFamily: _fontFamily,
      ),
      labelMedium: baseTextTheme.labelMedium?.copyWith(
        fontFamily: _fontFamily,
      ),
      labelSmall: baseTextTheme.labelSmall?.copyWith(
        fontFamily: _fontFamily,
      ),
    );
  }
}
