// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FinanceDropdownStyle {
  FinanceDropdownStyle(this.context);

  final BuildContext context;

  // Theme
  ThemeData get _theme => Theme.of(context);
  bool get _isDark => _theme.brightness == Brightness.dark;

  // Button Style
  ButtonStyleData get buttonStyle => const ButtonStyleData(width: 0);

  // Dropdown Style
  FinanceDropdownStyleData get dropdownStyle {
    return FinanceDropdownStyleData(
      maxHeight: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: _theme.colorScheme.primaryContainer,
      ),
    );
  }

  // Icon Style
  FinanceDropdownIconData get iconStyle {
    return FinanceDropdownIconData(
      icon: Icon(
        MdiIcons.chevronDown,
        color: _isDark ? Colors.white : const Color(0xff404040),
      ),
    );
  }

  // Menu Style
  FinanceDropdownMenuItemStyleData get menuItemStyle {
    return FinanceDropdownMenuItemStyleData(
      overlayColor: WidgetStateProperty.all<Color>(
        _theme.primaryColor.withOpacity(0.25),
      ),
      selectedMenuItemBuilder: (context, child) => DecoratedBox(
        decoration: BoxDecoration(
          color: _theme.primaryColor.withOpacity(0.125),
        ),
        child: child,
      ),
    );
  }

  MenuItemStyleData get multiSelectMenuItemStyle {
    return MenuItemStyleData(
      overlayColor: WidgetStateProperty.all<Color>(
        _theme.primaryColor.withOpacity(0.25),
      ),
      selectedMenuItemBuilder: (context, child) => DecoratedBox(
        decoration: BoxDecoration(
          color: _theme.primaryColor.withOpacity(0.125),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            child,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  color: _theme.primaryColor,
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Text Style
  TextStyle? get textStyle => _theme.textTheme.bodyLarge;

  /*
  DropdownMenuItem<T> firstItem<T>({
    required String title,
    required String actionTitle,
    void Function()? onTap,
    T? value,
    bool enabled = false,
  }) {
    return DropdownMenuItem(
      value: value,
      enabled: enabled,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: FinanceTextStyle.kSubtitleText.copyWith(
              fontSize: 16,
              color: FinanceAppColors.k03,
            ),
          ),
          Text.rich(
            TextSpan(
              text: actionTitle,
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
            style: FinanceTextStyle.kSubtitleText.copyWith(
              fontSize: 14,
              color: FinanceAppColors.kPrimary,
            ),
          ),
        ],
      ),
    );
  }
  */
}

@immutable
class FinanceDropdownStyleData extends DropdownStyleData {
  const FinanceDropdownStyleData({
    super.maxHeight,
    super.width,
    super.padding,
    super.scrollPadding,
    super.decoration,
    super.elevation,
    super.direction,
    super.offset,
    super.isOverButton,
    super.useSafeArea,
    super.isFullScreen,
    super.useRootNavigator,
    super.scrollbarTheme,
    super.openInterval,
  });

  FinanceDropdownStyleData copyWith({
    double? maxHeight,
    double? width,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? scrollPadding,
    BoxDecoration? decoration,
    int? elevation,
    DropdownDirection? direction,
    Offset? offset,
    bool? isOverButton,
    bool? useSafeArea,
    bool? isFullScreen,
    bool? useRootNavigator,
    ScrollbarThemeData? scrollbarTheme,
    Interval? openInterval,
  }) {
    return FinanceDropdownStyleData(
      maxHeight: maxHeight ?? this.maxHeight,
      width: width ?? this.width,
      padding: padding ?? this.padding,
      scrollPadding: scrollPadding ?? this.scrollPadding,
      decoration: decoration ?? this.decoration,
      elevation: elevation ?? this.elevation,
      direction: direction ?? this.direction,
      offset: offset ?? this.offset,
      isOverButton: isOverButton ?? this.isOverButton,
      useSafeArea: useSafeArea ?? this.useSafeArea,
      isFullScreen: isFullScreen ?? this.isFullScreen,
      useRootNavigator: useRootNavigator ?? this.useRootNavigator,
      scrollbarTheme: scrollbarTheme ?? this.scrollbarTheme,
      openInterval: openInterval ?? this.openInterval,
    );
  }
}

@immutable
class FinanceDropdownIconData extends IconStyleData {
  const FinanceDropdownIconData({
    super.icon,
    super.iconDisabledColor,
    super.iconEnabledColor,
    super.iconSize,
    super.openMenuIcon,
  });

  FinanceDropdownIconData copyWith({
    Widget? icon,
    Color? iconDisabledColor,
    Color? iconEnabledColor,
    double? iconSize,
    Widget? openMenuIcon,
  }) {
    return FinanceDropdownIconData(
      icon: icon ?? this.icon,
      iconDisabledColor: iconDisabledColor ?? this.iconDisabledColor,
      iconEnabledColor: iconEnabledColor ?? this.iconEnabledColor,
      iconSize: iconSize ?? this.iconSize,
      openMenuIcon: openMenuIcon ?? this.openMenuIcon,
    );
  }
}

@immutable
class FinanceDropdownMenuItemStyleData extends MenuItemStyleData {
  const FinanceDropdownMenuItemStyleData({
    super.customHeights,
    super.height,
    super.overlayColor,
    super.padding,
    super.selectedMenuItemBuilder,
  });

  FinanceDropdownMenuItemStyleData copyWith({
    List<double>? customHeights,
    double? height,
    Color? overlayColor,
    EdgeInsetsGeometry? padding,
    Widget Function(BuildContext, Widget)? selectedMenuItemBuilder,
  }) {
    return FinanceDropdownMenuItemStyleData(
      customHeights: customHeights ?? this.customHeights,
      height: height ?? this.height,
      overlayColor: overlayColor != null
          ? WidgetStateProperty.all<Color?>(overlayColor)
          : this.overlayColor,
      selectedMenuItemBuilder:
          selectedMenuItemBuilder ?? this.selectedMenuItemBuilder,
    );
  }
}
