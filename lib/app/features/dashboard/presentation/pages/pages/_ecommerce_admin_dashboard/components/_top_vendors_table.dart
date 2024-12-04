// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:intl/intl.dart';

// 🌎 Project imports:
import '../../../../../../../../generated/l10n.dart' as l;
import '../../../../../../../core/theme/theme.dart';
import '../../../../../../../models/models.dart' as model;
import '../../../../../../../widgets/widgets.dart';

class TopVendorsTable extends StatefulWidget {
  const TopVendorsTable({super.key});

  @override
  State<TopVendorsTable> createState() => _TopVendorsTableState();
}

class _TopVendorsTableState extends State<TopVendorsTable> {
  late final scrollController = ScrollController();

  final _otherDetails = [
    ("Fresh Banana Fruit", (4.0, 24), 575),
    ("Freshfarm Spaghetti", (3.0, 30), 575),
    ("Banana Milkshake", (5.0, 50), 575),
    ("Hershey's Chocola", (4.0, 15), 575),
    ("Banana Small", (4.0, 27), 575),
  ];

  bool _isHovering = false;
  int _hoveringIndex = -1;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = l.S.of(context);
    const columnWidths = <int, double>{
      0: 56, //FixedColumnWidth(60), //60,
      1: 175, //FixedColumnWidth(165), //165,
      2: 120, //FixedColumnWidth(165), //165,
      3: 120, //FixedColumnWidth(275), //275,
      4: 50, //FixedColumnWidth(205), //205,
    };

    final cellStyle = theme.textTheme.bodyMedium;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scrollbar(
          controller: scrollController,
          child: SingleChildScrollView(
            padding: const EdgeInsetsDirectional.only(bottom: 16),
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: Theme(
                data: theme.copyWith(
                  dividerTheme: theme.dividerTheme.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
                child: DataTable(
                  headingTextStyle: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  headingRowColor: WidgetStateProperty.all<Color?>(
                    theme.colorScheme.tertiaryContainer,
                  ),
                  dividerThickness: 0,
                  border: const TableBorder(
                    horizontalInside: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  columns: [
                    lang.image,
                    lang.name,
                    lang.review,
                    lang.sales,
                    lang.action,
                  ].asMap().entries.map((column) {
                    final width = columnWidths[column.key];
                    return DataColumn(
                      numeric: switch (column.key) {
                        5 || 6 || 7 => true,
                        _ => false,
                      },
                      label: Container(
                        width: width,
                        alignment: Alignment.center,
                        child: Text(column.value),
                      ),
                    );
                  }).toList(),
                  rows: model.MaanDemoGig.usersList
                      .take(5)
                      .toList()
                      .asMap()
                      .entries
                      .map(
                    (e) {
                      final details = _otherDetails[e.key];

                      final cells = <Widget>[
                        AvatarWidget(
                          imagePath: e.value.influencerImage,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          details.$1,
                          style: cellStyle,
                        ),
                        _buildReview(
                          context,
                          rating: details.$2.$1,
                          reviews: details.$2.$2,
                        ),
                        Text(
                          NumberFormat.simpleCurrency(
                            decimalDigits: 0,
                          ).format(details.$3),
                          style: cellStyle,
                        ),
                        Text.rich(
                          TextSpan(
                            text: '${lang.view} >',
                            onEnter: (event) {
                              setState(() {
                                _isHovering = true;
                                _hoveringIndex = e.key;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                _isHovering = false;
                                _hoveringIndex = -1;
                              });
                            },
                            mouseCursor: SystemMouseCursors.click,
                          ),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: _isHovering && (_hoveringIndex == e.key)
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onTertiaryContainer,
                          ),
                        ),
                      ];
                      return DataRow(
                        cells: List.generate(
                          cells.length,
                          (index) {
                            final child = cells[index];
                            return DataCell(
                              Container(
                                width: columnWidths[index],
                                alignment: AlignmentDirectional.center,
                                child: child,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildReview(
    BuildContext context, {
    double rating = 0.0,
    int reviews = 0,
  }) {
    assert(rating <= 5 && rating >= 0, "Rating must be between 0 and 5");

    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Row to display stars
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              5,
              (index) {
                final hasRating = index < rating;
                return Flexible(
                  child: Icon(
                    hasRating ? Icons.star : Icons.star_border,
                    size: 16,
                    color:
                        hasRating ? Colors.amber : FinanceAppColors.kNeutral300,
                  ),
                );
              },
            ),
          ),
        ),

        Text(
          "($reviews)",
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onTertiary,
          ),
        )
      ],
    );
  }
}
