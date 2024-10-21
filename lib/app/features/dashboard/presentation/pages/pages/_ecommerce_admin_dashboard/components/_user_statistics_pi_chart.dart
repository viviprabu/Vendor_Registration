// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:fl_chart/fl_chart.dart';
import 'package:responsive_grid/responsive_grid.dart';

// 🌎 Project imports:
import '../../../../../../../../generated/l10n.dart' as l;
import '../../../../../../../core/theme/theme.dart';

class UserStatisticsPiChart extends StatefulWidget {
  const UserStatisticsPiChart({super.key});

  @override
  State<UserStatisticsPiChart> createState() => _UserStatisticsPiChartState();
}

class _UserStatisticsPiChartState extends State<UserStatisticsPiChart> {
  int touchedIndex = -1;
  List<PiChartData> get _mockList => [
        PiChartData(
          color: FinanceAppColors.kPrimary600,
          //label: "Customer: 45",
          label: "${l.S.current.customer}: 45",
          value: 60,
        ),
        PiChartData(
          color: FinanceAppColors.kWarning,
          // label: "Store: 23",
          label: "${l.S.current.store}: 23",
          value: 40,
        ),
        PiChartData(
          color: FinanceAppColors.kSuccess,
          //label: "Delivery Man: 7",
          label: "${l.S.current.deliveryMan}: 7",
          value: 30,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final lang = l.S.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.biggest;

        final chartRadius = responsiveValue<double>(
          context,
          xs: size.height *
              (mqSize.width < 375
                  ? 0.115
                  : mqSize.width < 420
                      ? 0.135
                      : 0.175),
          md: size.height * (mqSize.width < 992 ? 0.20 : 0.225),
          lg: size.height * (mqSize.width < 1400 ? 0.20 : 0.25),
        );

        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 6,
              fit: FlexFit.loose,
              child: SizedBox.square(
                dimension: chartRadius + 24,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: PieChart(
                        PieChartData(
                          sectionsSpace: 4,
                          centerSpaceRadius: chartRadius * 0.95,
                          startDegreeOffset: -90,
                          pieTouchData: PieTouchData(
                            touchCallback: (event, pieTouchResponse) {
                              final isInteractionValid =
                                  event.isInterestedForInteractions &&
                                      pieTouchResponse?.touchedSection != null;
                              final newIndex = isInteractionValid
                                  ? pieTouchResponse!
                                      .touchedSection!.touchedSectionIndex
                                  : -1;

                              if (newIndex != touchedIndex) {
                                setState(() => touchedIndex = newIndex);
                              }
                            },
                          ),
                          sections: List.generate(
                            _mockList.length,
                            (index) {
                              final data = _mockList[index];
                              return PieChartSectionData(
                                radius: (chartRadius - (chartRadius * 0.5)) *
                                    (index == touchedIndex ? 1.05 : 1),
                                value: data.value,
                                color: data.color,
                                title: "${data.value}%",
                                showTitle: index == touchedIndex,
                                titleStyle: theme.textTheme.bodyLarge?.copyWith(
                                  color: theme.colorScheme.onPrimary,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: '75',
                          children: [
                            TextSpan(
                              //text: '\nTotal Users',
                              text: '\n${lang.totalUsers}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: responsiveValue<double?>(
                                  context,
                                  xs: mqSize.width < 420 ? 12 : 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: responsiveValue<double?>(
                            context,
                            xs: mqSize.width < 420 ? 14 : 24,
                            md: null,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: chartRadius * 1.25),
            Flexible(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  _mockList.length,
                  (index) {
                    final data = _mockList[index];
                    return Indicator(
                      color: data.color,
                      text: data.label,
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;

  const Indicator({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            constraints: BoxConstraints.tight(const Size.square(12)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}

class PiChartData {
  final Color color;
  final String label;
  final double value;

  const PiChartData({
    required this.color,
    required this.label,
    required this.value,
  });
}
