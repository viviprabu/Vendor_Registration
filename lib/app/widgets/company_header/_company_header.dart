// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;

// 🌎 Project imports:
import '../../core/app_config/app_config.dart';
import '../../core/helpers/fuctions/helper_functions.dart';
import '../../core/static/static.dart';
import '../../core/theme/theme.dart';

class CompanyHeaderWidget extends StatelessWidget {
  const CompanyHeaderWidget({
    super.key,
    this.showIconOnly = false,
    this.iconSize = const Size.square(32),
    this.showBottomBorder = false,
    this.onTap,
  });
  final bool showIconOnly;
  final Size iconSize;
  final bool showBottomBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap ?? () => context.go('/'),
        child: Container(
          padding: const EdgeInsetsDirectional.all(16),
          height: rf.ResponsiveValue<double?>(
            context,
            conditionalValues: [
              rf.Condition.largerThan(
                name: BreakpointName.SM.name,
                value: 70,
              )
            ],
          ).value,
          decoration: BoxDecoration(
            border: !showBottomBorder
                ? null
                : const Border(
                    bottom: BorderSide(color: FinanceAppColors.kNeutral300),
                  ),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: showIconOnly
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              // Logo
              Container(
                constraints: BoxConstraints.tight(iconSize),
                child: const AnimageWidget(
                  imagePath: AppConfig.appIcon,
                  fit: BoxFit.cover,
                  height: double.maxFinite,
                  width: double.maxFinite,
                ),
              ),

              if (!showIconOnly)
                Flexible(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 10),
                    child: Text(
                      AppConfig.appName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
