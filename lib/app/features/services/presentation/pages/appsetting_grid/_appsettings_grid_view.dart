// 🐦 Flutter imports:

import 'package:finance_app/app/features/services/domain/entities/appsetting.dart';
import 'package:finance_app/app/features/services/domain/entities/appsetting_roles.dart';
import 'package:finance_app/app/features/services/domain/entities/appsetting_sysfunction.dart';
import 'package:finance_app/app/features/services/presentation/bloc/appsetting_bloc.dart';
import 'package:finance_app/app/widgets/appsettings_grid_widget/appsettings_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// 📦 Package imports:
import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:responsive_grid/responsive_grid.dart';

// 🌎 Project imports:

List<AppSetting> appSetting = [];
List<AppSettingRoles> appSettingRoles = [];
List<AppSettingSysFunction> appSettingSysFunction = [];

class AppSettingGridView extends StatelessWidget {
  const AppSettingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AppSettingBloc>().add(AppSettingsListEvent());
    final sizeInfo = rf.ResponsiveValue<_SizeInfo>(
      context,
      conditionalValues: [
        const rf.Condition.between(
          start: 0,
          end: 480,
          value: _SizeInfo(
            alertFontSize: 12,
            padding: EdgeInsets.all(8),
            innerSpacing: 8,
          ),
        ),
        const rf.Condition.between(
          start: 481,
          end: 576,
          value: _SizeInfo(
            alertFontSize: 14,
            padding: EdgeInsets.all(12),
            innerSpacing: 12,
          ),
        ),
        const rf.Condition.between(
          start: 577,
          end: 992,
          value: _SizeInfo(
            alertFontSize: 14,
            padding: EdgeInsets.all(16),
            innerSpacing: 16,
          ),
        ),
      ],
      defaultValue: const _SizeInfo(),
    ).value;

    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 51, 51, 51),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('MEW Services'),
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontFamily: 'Segoe UI',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: const Color.fromARGB(255, 12, 12, 12))),
      body: Padding(
          padding: sizeInfo.padding / 2.5,
          child: BlocBuilder<AppSettingBloc, AppSettingState>(
              builder: (context, state) {
            if (state is AppSettingsListState) {
              appSetting = state.appSettings;
              // appSettingRoles = appSetting
              //     .map((item) => AppSettingRolesModal.fromJson(
              //         item as Map<String, dynamic>))
              //     .cast<AppSettingRoles>()
              //     .toList();
              // print(appSettingRoles);

              return SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(200, 25, 200, 25),
                    child: ResponsiveGridRow(
                      children: appSetting
                          .asMap()
                          .entries
                          .map(
                            (e) => ResponsiveGridCol(
                              lg: 3,
                              md: 6,
                              xs: 12,
                              child: FutureBuilder<String?>(
                                future: Future.delayed(
                                  const Duration(milliseconds: 2500),
                                  () => 'completed',
                                ),
                                builder: (context, snapshot) => Padding(
                                  padding: sizeInfo.padding / 2.5,
                                  child: Card(
                                    elevation: 20,
                                    shadowColor: Colors.blue,
                                    child: InkWell(
                                      onTap: () {
                                        context.go('/dashboard/home');
                                      },
                                      child: AppsettingsGridWidget(
                                        imagePath: e.value.imagePath,
                                        name: e.value.name.toString(),
                                        roles: [e.value.roles],
                                        sysFunction: [e.value.sysFunction],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              );
            }
            if (state is AppSettingLoadingState) {
              return Center(child: CircularProgressIndicator());
            }

            return Center(child: Text('Failed to load data.'));
          })),
    );
  }
}

class _SizeInfo {
  final double? alertFontSize;
  final EdgeInsetsGeometry padding;
  final double innerSpacing;

  const _SizeInfo({
    this.alertFontSize = 18,
    this.padding = const EdgeInsets.all(24),
    this.innerSpacing = 24,
  });
}
