// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:responsive_framework/responsive_framework.dart' as rf;

class CustomSegmentButton<T> extends StatelessWidget {
  const CustomSegmentButton({
    super.key,
    required this.segments,
    required this.selected,
    this.onSelectionChanged,
  });

  final List<ButtonSegment<T>> segments;
  final Set<T> selected;
  final void Function(Set<T> value)? onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const borderRadius = 4.0;

    final sizeInfo = rf.ResponsiveValue<_SizeInfo>(
      context,
      conditionalValues: [
        const rf.Condition.between(
          start: 0,
          end: 350,
          value: _SizeInfo(
            fonstSize: 10,
            padding: EdgeInsets.all(8),
          ),
        ),
        const rf.Condition.between(
          start: 351,
          end: 410,
          value: _SizeInfo(
            fonstSize: 12,
            padding: EdgeInsets.all(8),
          ),
        ),
        const rf.Condition.between(
          start: 411,
          end: 675,
          value: _SizeInfo(fonstSize: 12),
        ),
      ],
      defaultValue: const _SizeInfo(
        fonstSize: 12,
      ),
    ).value;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        segments.length,
        (segmentIndex) {
          final segment = segments[segmentIndex];
          final isSelected = selected.firstOrNull == segment.value;

          final isFirstSegment = segmentIndex == 0;
          final isLastSegment = segments.length == segmentIndex + 1;

          return Material(
            clipBehavior: Clip.antiAlias,
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onSelectionChanged?.call({segment.value}),
              splashColor: theme.splashColor,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected
                        ? theme.primaryColor
                        : theme.colorScheme.outline,
                    width: 1.25,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                  borderRadius: !(isFirstSegment || isLastSegment)
                      ? null
                      : BorderRadiusDirectional.horizontal(
                          start: isFirstSegment
                              ? const Radius.circular(borderRadius)
                              : Radius.zero,
                          end: isLastSegment
                              ? const Radius.circular(borderRadius)
                              : Radius.zero,
                        ),
                ),
                padding: sizeInfo.padding,
                child: Row(
                  children: [
                    if (segment.icon != null) segment.icon!,
                    if (segment.label != null)
                      if (segment.label is Text)
                        Text(
                          (segment.label! as Text).data!,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: sizeInfo.fonstSize,
                            color: isSelected ? theme.primaryColor : null,
                          ),
                        )
                      else
                        segment.label!
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SizeInfo {
  final double? fonstSize;
  final EdgeInsetsGeometry padding;
  const _SizeInfo({
    this.fonstSize,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  });
}
