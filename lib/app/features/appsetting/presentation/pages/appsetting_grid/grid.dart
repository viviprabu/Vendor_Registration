// import 'dart:ui';
// import 'package:finance_app/app/features/appsetting/domain/entities/appsetting.dart';
// import 'package:finance_app/app/features/appsetting/presentation/bloc/appsetting_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';

// List<AppSetting> appSetting = [];

// class GlossyView extends StatelessWidget {
//   const GlossyView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     context.read<AppSettingBloc>().add(AppSettingsListEvent());

//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           title: Text('MEW Applications'),
//           centerTitle: true,
//           titleTextStyle: TextStyle(
//               fontFamily: 'verdana',
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//               color: Colors.white)),
//       backgroundColor: const Color(0xff1C1760),
//       body: Stack(children: [
//         Positioned(
//             left: -220,
//             bottom: -200,
//             child: Container(
//               width: 400,
//               height: 400,
//               decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: const Color(0xff8369de).withOpacity(0.1),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Color(0xff8369de),
//                       spreadRadius: 90,
//                       blurRadius: 100,
//                     )
//                   ]),
//             )),
//         Positioned(
//             top: 130,
//             left: 220,
//             child: Container(
//               width: 300,
//               height: 300,
//               decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   gradient: LinearGradient(colors: [
//                     Color(0xff744ff9),
//                     Color(0xff8369de),
//                     Color(0xff8da0cb)
//                   ])),
//             )),
//         Positioned(
//             bottom: 250,
//             right: 150,
//             child: Transform.rotate(
//               angle: 8,
//               child: Container(
//                 width: 180,
//                 height: 180,
//                 decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: LinearGradient(colors: [
//                       Color(0xff744ff9),
//                       Color(0xff8369de),
//                       Color(0xff8da0cb)
//                     ])),
//               ),
//             )),
//         BlocBuilder<AppSettingBloc, AppSettingState>(builder: (context, state) {
//           if (state is AppSettingsListState) {
//             var appSetting = state.appSettings;

//             if (appSetting.isEmpty) {
//               return Center(child: Text('No Data available.'));
//             }
//           }

//           return ListView.builder(
//               itemCount: appSetting.length,
//               itemBuilder: (context, index) {
//                 var setting = appSetting[index];

//                 return Center(
//                     child: ClipRRect(
//                   borderRadius: const BorderRadius.all(Radius.circular(25)),
//                   child: BackdropFilter(
//                     filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
//                     child: Container(
//                       width: 450,
//                       height: 250,
//                       decoration: BoxDecoration(
//                           color: Colors.grey.withOpacity(0.1),
//                           border: Border.all(
//                               color: Colors.white.withOpacity(0.2), width: 2.5),
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(25))),
//                       child: Padding(
//                         padding: const EdgeInsets.fromLTRB(25, 10, 25, 30),
//                         child: BlocBuilder<AppSettingBloc, AppSettingState>(
//                             builder: (context, state) {
//                           if (state is AppSettingsListState) {
//                             appSetting = state.appSettings;
//                           }
//                           return Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                         margin: const EdgeInsets.only(top: 40),
//                                         child: Image.asset(
//                                           'assets/app_icons/h.png',
//                                           width: 70,
//                                           height: 70,
//                                         )),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     Text(setting.name.toString())
//                                     // SvgPicture.asset(
//                                     //   'assets/app_icons/visa.svg',
//                                     //   color: Colors.white,
//                                     //   width: 60,
//                                     // ),
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 const Expanded(
//                                   child: Text(
//                                     '6216 6102 0001 6587 010',
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 25,
//                                         fontWeight: FontWeight.w100,
//                                         wordSpacing: 3),
//                                   ),
//                                 ),
//                                 const Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       '02/12',
//                                       style: TextStyle(
//                                           fontSize: 15, color: Colors.white),
//                                     ),
//                                     Text(
//                                       'GZX',
//                                       style: TextStyle(
//                                           fontSize: 15, color: Colors.white),
//                                     )
//                                   ],
//                                 )
//                               ]);
//                         }),
//                       ),
//                     ),
//                   ),
//                 ));
//               });
//         }),
//       ]),
//     );
//   }
// }

import 'dart:ui';
import 'package:finance_app/app/features/appsetting/domain/entities/appsetting.dart';
import 'package:finance_app/app/features/appsetting/presentation/bloc/appsetting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class GlossyView extends StatelessWidget {
  const GlossyView({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger the event to fetch settings
    context.read<AppSettingBloc>().add(AppSettingsListEvent());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('MEW Applications'),
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontFamily: 'verdana',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white),
      ),
      backgroundColor: const Color(0xff1C1760),
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
                    shape: BoxShape.circle,
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

                return ListView.builder(
                  itemCount: appSetting.length,
                  itemBuilder: (context, index) {
                    var setting = appSetting[index];

                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                            child: Container(
                              width: 450,
                              height: 250,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.2),
                                    width: 2.5),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25)),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 10, 25, 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 40),
                                          child: Image.asset(
                                            'assets/app_icons/app_icon_main.png',
                                            width: 70,
                                            height: 70,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          setting.name ?? "Unknown",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      setting.name ?? '',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w100,
                                          wordSpacing: 3),
                                    ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Text(
                                    //       setting.expiryDate ?? 'MM/YY',
                                    //       style: TextStyle(
                                    //           fontSize: 15, color: Colors.white),
                                    //     ),
                                    //     Text(
                                    //       setting.cardHolder ?? 'GZX',
                                    //       style: TextStyle(
                                    //           fontSize: 15, color: Colors.white),
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
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
