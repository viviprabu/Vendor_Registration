// 🐦 Flutter imports:
import 'package:finance_app/app/widgets/initialUploads_grid_widget%20copy/initialUploads_grid_widget.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:responsive_grid/responsive_grid.dart';

// 🌎 Project imports:
import 'demo_initial_uploads.dart';

List<DemoInitialuploads> demoInitialUploads = [];

class InitialUploadsGridView extends StatelessWidget {
  const InitialUploadsGridView({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: sizeInfo.padding / 2.5,
        child: SingleChildScrollView(
          child: ResponsiveGridRow(
            children: demoInitialUploads
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
                        child: InitialUploadsGridWidget(
                          imagePath: e.value.imagePath,
                          name: e.value.name,
                          roles: [],
                          sysFunction: [],
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
