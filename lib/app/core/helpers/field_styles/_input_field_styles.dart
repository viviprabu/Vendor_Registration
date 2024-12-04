// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class FinanceInputFieldStyles {
  FinanceInputFieldStyles(this.context);

  final BuildContext context;

  // Theme
  ThemeData get _theme => Theme.of(context);

  Color get disabledFieldColor => _theme.colorScheme.tertiaryContainer;

  BoxConstraints? get iconConstraints {
    return const BoxConstraints.tightFor(
      height: 24,
      width: 24 * 1.65,
    );
  }

  OutlineInputBorder? getRoundedBorder({
    RoundedBorderType? getRoundedBorderType = RoundedBorderType.border,
    BorderRadius? borderRadius,
    Color? borderColor,
    double borderWidth = 1,
    BorderStyle? style,
    double? strokeAlign,
    double gapPadding = 4.0,
  }) {
    final tID = _theme.inputDecorationTheme;
    final currentBorderSide = switch (getRoundedBorderType) {
      RoundedBorderType.border => tID.border?.borderSide,
      RoundedBorderType.enabledBorder => tID.enabledBorder?.borderSide,
      RoundedBorderType.focusedBorder => tID.focusedBorder?.borderSide,
      RoundedBorderType.errorBorder => tID.errorBorder?.borderSide,
      RoundedBorderType.focusedErrorBorder =>
        tID.focusedErrorBorder?.borderSide,
      RoundedBorderType.disabledBorder => tID.disabledBorder?.borderSide,
      _ => null,
    };

    return OutlineInputBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(40),
      borderSide: currentBorderSide ?? BorderSide.none,
      gapPadding: gapPadding,
    );
  }
}

enum RoundedBorderType {
  border,
  enabledBorder,
  focusedBorder,
  errorBorder,
  focusedErrorBorder,
  disabledBorder,
}
