// 🐦 Flutter imports:
import 'package:finance_app/app/core/theme/_app_colors.dart';
import 'package:finance_app/app/features/auth/domain/entities/user_rights.dart';
import 'package:finance_app/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 📦 Package imports:
import 'package:responsive_framework/responsive_framework.dart' as rf;

// 🌎 Project imports:

// ignore: must_be_immutable
class ServicesView extends StatefulWidget {
  List<UserRights>? userRights = [];
  ServicesView({super.key, this.userRights});

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  @override
  void initState() {
    context.read<AuthBloc>().add(GetAuthenicatedUserEvent());
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
          child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            if (state is GetAuthenicatedUserState) {
              widget.userRights = state.user.userRights;
            }

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

                  if (widget.userRights == null || widget.userRights!.isEmpty) {
                    return Center(
                        child: Text('You dont have any applications'));
                  }

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: widget.userRights?.length ?? 0,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          //context.goNamed('home');
                          /* final Uri appUrl = Uri.parse(
                            'http://localhost:58947/dashboard/home',
                            
                          );
                          _launchUrl(appUrl); */
                          /*  final Uri appUrl = Uri.parse(
                            'http://localhost:58947/dashboard/home',
                          ); */

                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          var token = sharedPreferences.getString('token');

                          final Uri appUrl = Uri.parse(
                            'http://localhost:57999/application/landing?roleId=${widget.userRights?[index].roleId}&token=$token',
                          );

                          _launchUrl(appUrl);
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
                                  Text(
                                    widget.userRights?[index]
                                            .applicationSettingName
                                            .toString() ??
                                        'Unknown',
                                    style: textTheme.bodyMedium,
                                  ),
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

/* Future<void> _launchUrl(Uri url) async =>
    canLaunchUrl(url).then((bool canLaunch) async {
      if (canLaunch) {
        await launchUrl(url);
      } else {
        print('Cannot launch URL');
      }
    }); */

Future<void> _launchUrl(Uri url) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final token = sharedPreferences.getString('token');
  final bool canLaunch = await canLaunchUrl(url);

  if (canLaunch) {
    await launchUrl(
      url,
      /* webViewConfiguration: WebViewConfiguration(
        headers: {
          'Authorization': 'Bearer $token', // Pass the token here
        },
      ), */
    );
  } else {
    print('Cannot launch URL');
  }
}
