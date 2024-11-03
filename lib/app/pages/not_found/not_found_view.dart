// 🐦 Flutter imports:
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/models/_variable_model.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

// 🌎 Project imports:
import '../../../generated/l10n.dart' as l;

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = l.S.of(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * .24,
              'assets/images/widget_images/not_found_images/not_found.svg',
            ),
            const SizedBox(height: 20.0),
            Text(
              lang.OoopsPageNotFound,
              // 'Ooops! Page Not Found',
              textAlign: TextAlign.center,
              style: textTheme.headlineLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8.0),
            Text(
              lang.thisPageDoesNotExist,
              //'This page doesn\'t exist or was removed! \nWe suggest you back to home',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium
                  ?.copyWith(color: theme.colorScheme.onTertiary),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
              ),
              onPressed: () {
                context.go('/authentication/signin');
              },
              // label: const Text('Go Back'),
              label: Text(lang.goBack),
            )
          ],
        ),
      ),
    );
  }
}
