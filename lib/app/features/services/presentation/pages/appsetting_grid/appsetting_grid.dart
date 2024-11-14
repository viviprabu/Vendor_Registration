import 'dart:ui';
import 'package:finance_app/app/features/services/presentation/bloc/appsetting_bloc.dart';
import 'package:finance_app/app/widgets/company_header/_company_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:responsive_grid/responsive_grid.dart';

class AppSettingGlossyView extends StatelessWidget {
  const AppSettingGlossyView({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger the event to fetch settings
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
      appBar: AppBar(
        leading: Icon(
          Icons.app_registration_rounded,
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        title: Text('MEW SERVICES'),
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
      ),

      backgroundColor: const Color.fromARGB(255, 16, 11, 85),

      // rgba(10, 101, 198, 1.00)

      body: Stack(
        children: [
          // Decorative background circles
          Positioned(
            left: -220,
            bottom: -200,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                // image: DecorationImage(
                //     image: AssetImage('assets/app_icons/app_icon_main.png')),
                shape: BoxShape.circle,
                color: const Color(0xff8369de).withOpacity(0.1),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xff8369de),
                    spreadRadius: 90,
                    blurRadius: 100,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: 220,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color(0xff744ff9),
                    Color(0xff8369de),
                    Color(0xff8da0cb)
                  ])),
            ),
          ),
          Positioned(
            bottom: 250,
            right: 150,
            child: Transform.rotate(
              angle: 8,
              child: Container(
                width: 180,
                height: 180,
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    gradient: LinearGradient(colors: [
                      Color(0xff744ff9),
                      Color(0xff8369de),
                      Color(0xff8da0cb)
                    ])),
              ),
            ),
          ),
          // Main content with the BlocBuilder
          BlocBuilder<AppSettingBloc, AppSettingState>(
            builder: (context, state) {
              if (state is AppSettingsListState) {
                var appSetting = state.appSettings;

                if (appSetting.isEmpty) {
                  return Center(child: Text('No Data available.'));
                }

                return ResponsiveGridRow(
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
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  context.go('/dashboard/home');
                                },
                                child: Center(
                                  child: Padding(
                                    padding: sizeInfo.padding / 2.5,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(25)),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 30, sigmaY: 30),
                                        child: Container(
                                          width: 350,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.1),
                                            border: Border.all(
                                                color: Colors.white
                                                    .withOpacity(0.2),
                                                width: 2.5),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(25)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                25, 10, 25, 30),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 40),
                                                      child: Image.asset(
                                                        'assets/app_icons/app_icon_main.png',
                                                        width: 70,
                                                        height: 70,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text(
                                                      e.value.name ?? "Unknown",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  e.value.name ?? '',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      wordSpacing: 3),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );

                // return GridView.builder(
                //   // physics: const ScrollPhysics(),
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2, // number of items in each row
                //     mainAxisSpacing: 8.0, // spacing between rows
                //     crossAxisSpacing: 8.0, // spacing between columns
                //   ),
                //   itemCount: appSetting.length,
                //   itemBuilder: (context, index) {
                //     var setting = appSetting[index];

                // return Center(
                //   child: Padding(
                //     padding: sizeInfo.padding / 2.5,
                //     child: ClipRRect(
                //       borderRadius:
                //           const BorderRadius.all(Radius.circular(25)),
                //       child: BackdropFilter(
                //         filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                //         child: Container(
                //           width: 450,
                //           height: 250,
                //           decoration: BoxDecoration(
                //             color: Colors.grey.withOpacity(0.1),
                //             border: Border.all(
                //                 color: Colors.white.withOpacity(0.2),
                //                 width: 2.5),
                //             borderRadius:
                //                 const BorderRadius.all(Radius.circular(25)),
                //           ),
                //           child: Padding(
                //             padding:
                //                 const EdgeInsets.fromLTRB(25, 10, 25, 30),
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Row(
                //                   mainAxisAlignment:
                //                       MainAxisAlignment.spaceBetween,
                //                   crossAxisAlignment:
                //                       CrossAxisAlignment.start,
                //                   children: [
                //                     Container(
                //                       margin:
                //                           const EdgeInsets.only(top: 40),
                //                       child: Image.asset(
                //                         'assets/app_icons/app_icon_main.png',
                //                         width: 70,
                //                         height: 70,
                //                       ),
                //                     ),
                //                     const SizedBox(height: 10),
                //                     Text(
                //                       setting.name ?? "Unknown",
                //                       style: TextStyle(
                //                           color: Colors.white,
                //                           fontSize: 18),
                //                     ),
                //                   ],
                //                 ),
                //                 const SizedBox(height: 10),
                //                 Text(
                //                   setting.name ?? '',
                //                   style: TextStyle(
                //                       color: Colors.white,
                //                       fontSize: 25,
                //                       fontWeight: FontWeight.w100,
                //                       wordSpacing: 3),
                //                 ),
                //                 // Row(
                //                 //   mainAxisAlignment:
                //                 //       MainAxisAlignment.spaceBetween,
                //                 //   children: [
                //                 //     Text(
                //                 //       setting.expiryDate ?? 'MM/YY',
                //                 //       style: TextStyle(
                //                 //           fontSize: 15, color: Colors.white),
                //                 //     ),
                //                 //     Text(
                //                 //       setting.cardHolder ?? 'GZX',
                //                 //       style: TextStyle(
                //                 //           fontSize: 15, color: Colors.white),
                //                 //     ),
                //                 //   ],
                //                 // ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // );
                //   },
                // );
              }

              // Loading or error state handling
              if (state is AppSettingLoadingState) {
                return Center(child: CircularProgressIndicator());
              }

              return Center(child: Text('Failed to load data.'));
            },
          ),
        ],
      ),
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
