// 🐦 Flutter imports:

import 'package:finance_app/app/core/theme/_app_colors.dart';
import 'package:finance_app/app/features/services/domain/entities/appsetting.dart';
import 'package:finance_app/app/features/services/domain/entities/appsetting_roles.dart';
import 'package:finance_app/app/features/services/domain/entities/appsetting_sysfunction.dart';
import 'package:finance_app/app/features/services/presentation/bloc/appsetting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// 📦 Package imports:
import 'package:responsive_framework/responsive_framework.dart' as rf;

// 🌎 Project imports:

class AppSettingResponsiveGridView extends StatefulWidget {
  const AppSettingResponsiveGridView({super.key});

  @override
  State<AppSettingResponsiveGridView> createState() =>
      _AppSettingResponsiveGridViewState();
}

class _AppSettingResponsiveGridViewState
    extends State<AppSettingResponsiveGridView> {
  List<AppSetting> appSetting = [];
  List<AppSettingRoles> appSettingRoles = [];
  List<AppSettingSysFunction> appSettingSysFunction = [];
  // late final AnimatedSvgController controller;

  @override
  void initState() {
    // Initialize SvgController
    // controller = AnimatedSvgController();
    print(appSetting);
    super.initState();
  }

  // @override
  // void dispose() {
  //   // Dispose SvgController
  //   // controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);

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
              // if (kDebugMode) {
              //   print(appSetting);
              // }
              return Padding(
                padding: const EdgeInsets.all(20),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Adjust number of columns based on the screen width
                    int crossAxisCount;

                    if (constraints.maxWidth < 600) {
                      // Small screen (Phone)
                      crossAxisCount = 2;
                    } else if (constraints.maxWidth < 1200) {
                      // Medium screen (Tablet/Small screen)
                      crossAxisCount = 4;
                    } else {
                      // Large screen (Desktop/Large Tablet)
                      crossAxisCount = 6;
                    }

                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: appSetting.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context.go('/dashboard/home');
                          },
                          child: Card(
                            shadowColor: FinanceAppColors.kPrimary900,
                            surfaceTintColor: const Color(0xffddecff),
                            elevation: 50,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                        'assets/app_icons/app_icon_main.png',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover),
                                    const SizedBox(
                                      height: 10,
                                    ),

                                    // AnimatedSvg(
                                    //   controller: controller,
                                    //   duration:
                                    //       const Duration(milliseconds: 600),
                                    //   onTap: () {},
                                    //   size: 80,
                                    //   clockwise: true,
                                    //   isActive: true,
                                    //   children: [
                                    //     SvgPicture.asset(
                                    //       'assets/images/widget_images/svg_icons/gallery_icon.svg',
                                    //     ),
                                    //     SvgPicture.asset(
                                    //       'assets/images/widget_images/svg_icons/send.svg',
                                    //     ),
                                    //   ],
                                    // ),

                                    Text(appSetting[index].name.toString(),
                                        style: textTheme.bodyMedium),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
              // appSettingRoles = appSetting
              //     .map((item) => AppSettingRolesModal.fromJson(
              //         item as Map<String, dynamic>))
              //     .cast<AppSettingRoles>()
              //     .toList();
              // print(appSettingRoles);

              // return Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: GridView.builder(
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2, // Two items per row
              //       crossAxisSpacing: 10,
              //       mainAxisSpacing: 10,
              //     ),
              //     itemCount: appSetting.length,
              //     itemBuilder: (context, index) {
              //       var item = appSetting[index];
              //       return Card(
              //         shadowColor: Colors.blue[600],
              //         elevation: 30,
              //         child: Column(
              //           children: [
              //             // Assuming you have image URLs stored in the database
              //             Image.network('assets/app_icons/app_icon_main.png',
              //                 fit: BoxFit.cover),
              //             const SizedBox(
              //               height: 16,
              //             ),
              //             Text(item.name.toString(),
              //                 textAlign: TextAlign.center),
              //           ],
              //         ),
              //       );
              //     },
              //   ),
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
