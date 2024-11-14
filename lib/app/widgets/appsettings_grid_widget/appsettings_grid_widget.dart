// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:responsive_framework/responsive_framework.dart' as rf;

// 🌎 Project imports:
import '../../../generated/l10n.dart' as l;
import '../../core/helpers/fuctions/helper_functions.dart';
import '../../core/theme/theme.dart';

class AppsettingsGridWidget extends StatefulWidget {
  const AppsettingsGridWidget(
      {super.key,
      required this.imagePath,
      required this.name,
      required this.roles,
      required this.sysFunction});

  final String imagePath;
  final String name;
  final List<dynamic> roles;
  final List<dynamic> sysFunction;

  @override
  _AppsettingsGridWidgetState createState() => _AppsettingsGridWidgetState();
}

class _AppsettingsGridWidgetState extends State<AppsettingsGridWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = l.S.of(context);
    final textTheme = theme.textTheme;
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

    return LayoutBuilder(
      builder: (context, constraints) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) {
            setState(() {
              _isHovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              _isHovered = false;
            });
          },
          child: Container(
            width: constraints.maxWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                // color: theme.colorScheme.primaryContainer,
                color: Colors.blue[50]),
            child: Padding(
              padding: sizeInfo.padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// -------------image
                  Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: getImageType(
                      widget.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),

                  /// -------------name
                  Text(
                    widget.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                      color: _isHovered
                          ? FinanceAppColors.kPrimary600
                          : theme
                              .colorScheme.onTertiary, // Color changes on hover
                    ),
                  ),

                  /// -------------designation
                  Text(
                    widget.name,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onTertiary,
                    ),
                  ),
                  SizedBox(height: sizeInfo.innerSpacing),

                  /// -------------followers & following
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Flexible(
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(
                      //         vertical: 10, horizontal: 16),
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(6),
                      //       border:
                      //           Border.all(color: theme.colorScheme.outline),
                      //     ),
                      //     child: Text(
                      //       // '${widget.following} followers',
                      //       // '${widget.following} ${lang.followers}',
                      //       '',
                      //       maxLines: 1,
                      //       softWrap: true,
                      //       style: textTheme.bodySmall,
                      //       overflow: TextOverflow.ellipsis,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(width: sizeInfo.innerSpacing),
                      // Flexible(
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(
                      //         vertical: 10, horizontal: 16),
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(6),
                      //       border: Border.all(
                      //           color: theme.colorScheme
                      //               .outline), // Use appropriate color
                      //     ),
                      //     child: Text(
                      //       //'${widget.following} following', maxLines: 1, softWrap: true,
                      //       // '${widget.following} ${lang.following}',
                      //       '',
                      //       maxLines: 1, softWrap: true,
                      //       style: textTheme.bodySmall,
                      //       overflow:
                      //           TextOverflow.ellipsis, // Use appropriate style
                      //     ),
                      //   ),
                      // )
                    ],
                  ),

                  /// divider
                  SizedBox(height: sizeInfo.innerSpacing),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: theme.colorScheme.outline, // Use appropriate color
                  ),

                  /// -------------footer values
                  SizedBox(height: sizeInfo.innerSpacing),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // _value(widget.name, lang.name, textTheme),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _value(String value, String label, TextTheme textTheme) {
    return Column(
      children: [
        Text(
          value,
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onTertiary,
          ), // Use appropriate color
        ),
      ],
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
