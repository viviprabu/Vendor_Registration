import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:intl/intl.dart' as intl;
import '../../../generated/l10n.dart' as l;
import '../../core/theme/theme.dart';

class OverviewCardWidget extends StatelessWidget {
  final String title;
  final num value;
  final bool showCompactValue;
  final num fluctuationAmount;
  final bool showCompactFluctuation;
  final String? fluctuationFrequency;

  final Color? cardColor;
  final Decoration? fluctuationBgDecoration;
  final EdgeInsetsGeometry? fluctuationBgPadding;
  final bool hasIncreases;
  final String? customCurrency;
  final bool showCurrency;
  const OverviewCardWidget({
    super.key,
    required this.title,
    required this.value,
    this.showCompactValue = false,
    this.fluctuationAmount = 0,
    this.showCompactFluctuation = false,
    this.fluctuationFrequency,
    this.cardColor,
    this.fluctuationBgDecoration,
    this.fluctuationBgPadding,
    this.hasIncreases = true,
    this.customCurrency,
    this.showCurrency = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = Localizations.localeOf(context);
    final currency = customCurrency ??
        intl.NumberFormat.simpleCurrency(locale: locale.countryCode)
            .currencySymbol;

    final fluctuationColor =
        hasIncreases ? FinanceAppColors.kSuccess : FinanceAppColors.kError;

    final value1 = showCompactValue
        ? intl.NumberFormat.compactCurrency(
            decimalDigits: 0,
            symbol: showCurrency ? currency : '',
          ).format(value)
        : intl.NumberFormat.currency(
            decimalDigits: 0,
            symbol: showCurrency ? currency : '',
          ).format(value);

    final fluctuationAmount1 = showCompactFluctuation
        ? intl.NumberFormat.compactCurrency(
            decimalDigits: 0,
            symbol: showCurrency ? currency : '',
          ).format(fluctuationAmount)
        : intl.NumberFormat.currency(
            decimalDigits: 0,
            symbol: showCurrency ? currency : '',
          ).format(fluctuationAmount);

    return Card(
      color: cardColor ?? theme.colorScheme.primaryContainer,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Value
            Text(
              value1,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: FinanceAppColors.kNeutral900,
              ),
            ),
            const SizedBox(height: 4),

            // Title
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: FinanceAppColors.kNeutral700,
              ),
            ),
            const SizedBox(height: 16),

            Container(
              padding: fluctuationBgPadding ?? const EdgeInsets.all(8),
              decoration: fluctuationBgDecoration ??
                  BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(4),
                  ),
              child: Row(
                children: [
                  Icon(
                    hasIncreases
                        ? FeatherIcons.arrowUp
                        : FeatherIcons.arrowDown,
                    size: 14,
                    color: fluctuationColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      fluctuationAmount1,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: fluctuationColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        fluctuationFrequency ?? l.S.current.thisMonth,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: FinanceAppColors.kNeutral700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
