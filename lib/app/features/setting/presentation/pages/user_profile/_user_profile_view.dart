// 🐦 Flutter imports:
import 'package:finance_app/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:finance_app/app/features/user/domain/entities/user.dart';
import 'package:finance_app/app/features/user/presentation/pages/user_profile/user_profile_details_widget.dart';
import 'package:finance_app/app/features/user/presentation/pages/user_profile/user_profile_update_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 📦 Package imports:
import 'package:responsive_grid/responsive_grid.dart';

// 🌎 Project imports:

import '../../../../../../generated/l10n.dart' as l;
import '../../../../../core/helpers/fuctions/_get_image.dart';
import '../../../../../widgets/shadow_container/_shadow_container.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(GetAuthenicatedUserEvent());
    final theme = Theme.of(context);
    final lang = l.S.of(context);
    final textTheme = theme.textTheme;
    final padding = responsiveValue<double>(
      context,
      xs: 16 / 2,
      sm: 16 / 2,
      md: 16 / 2,
      lg: 24 / 2,
    );
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        User? userDetails;

        if (authState is GetAuthenicatedUserState) {
          userDetails = authState.user;
          //print(userDetails.name);
        }

        return Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(padding),
            child: ResponsiveGridRow(
              children: [
                ///-----------------------------user_profile_details
                ResponsiveGridCol(
                  lg: 6,
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ShadowContainer(
                          contentPadding: EdgeInsets.zero,
                          showHeader: false,
                          child: UserProfileDetailsWidget(
                            padding: padding,
                            theme: theme,
                            textTheme: textTheme,
                            userDetails: userDetails,
                          ),
                        ),

                        /// -------------image
                        Positioned(
                          top: 123,
                          child: Container(
                            height: 110,
                            width: 110,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: getImageType(
                              _userProfile.$1,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                ///-----------------------------user_profile_update
                ResponsiveGridCol(
                  lg: 6,
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: ShadowContainer(
                      contentPadding: EdgeInsets.all(padding),
                      // headerText: 'User Profile',
                      headerText: lang.userProfile,
                      child: UserProfileUpdateWidget(
                          textTheme: textTheme, userDetails: userDetails),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

const (String,) _userProfile =
    ('assets/images/static_images/avatars/person_images/person_image_01.jpeg',);
