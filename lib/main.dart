// 🐦 Flutter imports:
import 'package:finance_app/app/bloc/language/language_bloc.dart';
import 'package:finance_app/app/bloc/theme/theme_bloc.dart';
import 'package:finance_app/app/features/services/presentation/bloc/appsetting_bloc.dart';
import 'package:finance_app/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:finance_app/app/features/department/presentation/bloc/department_bloc.dart';
import 'package:finance_app/app/features/section/presentation/bloc/section_bloc.dart';
import 'package:finance_app/app/features/sector/presentation/bloc/sector_bloc.dart';
import 'package:finance_app/app/features/setting/presentation/bloc/setting_bloc.dart';
import 'package:finance_app/app/features/setting/presentation/bloc/setting_event.dart';
import 'package:finance_app/app/features/user/presentation/bloc/user_bloc.dart';
import 'package:finance_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 📦 Package imports:
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_strategy/url_strategy.dart';

// 🌎 Project imports:
import 'app/core/app_config/app_config.dart';
import 'app/core/static/static.dart';
import 'app/core/theme/theme.dart';
import 'app/routes/app_routes.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  setPathUrlStrategy();
  init();
  WidgetsFlutterBinding.ensureInitialized();
  ResponsiveGridBreakpoints.value = ResponsiveGridBreakpoints(
    sm: 576,
    md: 1240,
    lg: double.infinity,
  );

  final app = MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => ThemeBloc()),
      BlocProvider(create: (context) => LanguageBloc()),
      BlocProvider(
        create: (context) => getIt<AuthBloc>()
          ..add(
            AuthInitialEvent(),
          ),
      ),
      BlocProvider(
        create: (context) => getIt<UserBloc>()
          ..add(
            UserInitialEvent(),
          ),
      ),
      BlocProvider(
          create: (context) => getIt<SectorBloc>()..add(SectorInitialEvent())),
      BlocProvider(
        create: (context) =>
            getIt<DepartmentBloc>()..add(DepartmentInitialEvent()),
      ),
      BlocProvider(
          create: (context) =>
              getIt<SectionBloc>()..add(SectionInitialEvent())),
      BlocProvider(
          create: (context) =>
              getIt<AppSettingBloc>()..add(AppSettingInitialEvent())),
      BlocProvider(
          create: (context) =>
              getIt<SettingBloc>()..add(SettingInitialEvent())),
    ],
    child: const FinanceApp(),
  );

  return runApp(app);
}

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, langState) {
            return rf.ResponsiveBreakpoints.builder(
              breakpoints: [
                rf.Breakpoint(
                  start: BreakpointName.XS.start,
                  end: BreakpointName.XS.end,
                  name: BreakpointName.XS.name,
                ),
                rf.Breakpoint(
                  start: BreakpointName.SM.start,
                  end: BreakpointName.SM.end,
                  name: BreakpointName.SM.name,
                ),
                rf.Breakpoint(
                  start: BreakpointName.MD.start,
                  end: BreakpointName.MD.end,
                  name: BreakpointName.MD.name,
                ),
                rf.Breakpoint(
                  start: BreakpointName.LG.start,
                  end: BreakpointName.LG.end,
                  name: BreakpointName.LG.name,
                ),
                rf.Breakpoint(
                  start: BreakpointName.XL.start,
                  end: BreakpointName.XL.end,
                  name: BreakpointName.XL.name,
                ),
              ],
              child: MaterialApp.router(
                title: AppConfig.appName,
                theme: FinanceAppTheme.kLightTheme(),
                darkTheme: FinanceAppTheme.kDarkTheme(),
                themeMode: themeState.themeMode,

                builder: (context, child) => MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: TextScaler.linear(rf.ResponsiveValue<double>(
                      context,
                      conditionalValues: [],
                      defaultValue: 1.0,
                    ).value),
                  ),
                  child: Directionality(
                    textDirection: langState.isRTL
                        ? TextDirection.rtl
                        : Directionality.of(context),
                    child: child!,
                  ),
                ),

                // Language & Locale
                locale: langState.locale,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,

                // Navigation Configuration
                routerConfig: FinanceAppRoutes.routerConfig,
                debugShowCheckedModeBanner: false,
              ),
            );
          },
        );
      },
    );
  }
}
