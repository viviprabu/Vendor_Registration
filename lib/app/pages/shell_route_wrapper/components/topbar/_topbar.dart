// 🐦 Flutter imports:

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:finance_app/app/bloc/language/language_bloc.dart';
import 'package:finance_app/app/bloc/theme/theme_bloc.dart';
import 'package:finance_app/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// 📦 Package imports:
import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:responsive_grid/responsive_grid.dart';

// 🌎 Project imports:
import '../../../../../generated/l10n.dart' as l;
import '../../../../core/static/static.dart';
import '../../../../core/helpers/helpers.dart';
import '../../../../widgets/widgets.dart';
import '../language_dropdown/_language_dropdown.dart';

part '_notification_icon_button.dart';
part '_toggle_theme.dart';
part '_user_profile_avatar.dart';

class TopBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const TopBarWidget({super.key, this.onMenuTap});

  final void Function()? onMenuTap;

  @override
  Widget build(BuildContext context) {
    final lang = l.S.of(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        // TODO: implement listener
        if (state is AuthSignedOutState) {
          context.go('/authentication/signin');
        }
      },
      child: AppBar(
        leading: rf.ResponsiveValue<Widget?>(
          context,
          conditionalValues: [
            rf.Condition.largerThan(
              name: BreakpointName.MD.name,
              value: null,
            ),
          ],
          defaultValue: IconButton(
            onPressed: onMenuTap,
            icon: Tooltip(
              // message: 'Open Navigation menu',
              message: lang.openNavigationMenu,
              waitDuration: const Duration(milliseconds: 350),
              child: const Icon(Icons.menu),
            ),
          ),
        ).value,
        toolbarHeight: rf.ResponsiveValue<double?>(
          context,
          conditionalValues: [
            rf.Condition.largerThan(name: BreakpointName.SM.name, value: 70)
          ],
        ).value,
        surfaceTintColor: Colors.transparent,
        actions: [
          // Language Dropdown
          BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, langState) {
              return LanguageDropdownWidget(
                value: langState.locale,
                supportedLanguage: context.read<LanguageBloc>().locales,
                onChanged: (locale) {
                  context.read<LanguageBloc>().add(ChangeLanguage(locale!));
                },
              );
            },
          ),
          const SizedBox(width: 8),

          // Toggle Theme Button
          BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
            return ThemeToggler(
                isDarkMode: themeState.themeMode == ThemeMode.dark,
                onChanged: (isDark) {
                  context.read<ThemeBloc>().add(
                        ToggleTheme(isDark),
                      );
                });
          }),

          // Notification Icon
          const Padding(
            padding: EdgeInsetsDirectional.only(start: 0, end: 12),
            child: NotificationIconButton(),
          ),

          // User Avatar
          UserProfileAvatar(),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 64);
}
