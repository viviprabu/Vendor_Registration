// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class FinanceFileInputField extends StatelessWidget {
  const FinanceFileInputField({
    super.key,
    this.onTap,
    this.decoration,
    this.filePath,
    this.prefixText,
    this.prefixStyle,
    this.textStyle,
  });
  final void Function()? onTap;
  final InputDecoration? decoration;
  final String? filePath;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final currentDecoration = decoration ?? const InputDecoration();

    final enabledBorder =
        currentDecoration.enabledBorder as OutlineInputBorder?;

    return Material(
      borderRadius: enabledBorder?.borderRadius,
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final size = constraints.biggest;
            return InputDecorator(
              decoration: currentDecoration.copyWith(
                contentPadding: EdgeInsetsDirectional.zero,
                prefix: Container(
                  margin: EdgeInsetsDirectional.all(
                    currentDecoration.enabledBorder?.borderSide.width ?? 1,
                  ),
                  constraints: BoxConstraints(
                    minWidth: 100,
                    maxWidth: size.width > 120 ? 120 : size.width * 0.35,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.tertiaryContainer,
                    border: Border(
                      right: BorderSide(
                        color: enabledBorder?.borderSide.color ??
                            (theme.inputDecorationTheme.enabledBorder
                                    as OutlineInputBorder?)
                                ?.borderSide
                                .color ??
                            Colors.black,
                      ),
                    ),
                    borderRadius: BorderRadius.horizontal(
                      left: (currentDecoration.enabledBorder
                                  as OutlineInputBorder?)
                              ?.borderRadius
                              .topLeft ??
                          const Radius.circular(4),
                    ),
                  ),
                  padding: currentDecoration.contentPadding,
                  alignment: Alignment.center,
                  child: Text(
                    prefixText ?? 'Choose File',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onTertiaryContainer,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                child: Text(
                  filePath ?? currentDecoration.hintText ?? 'Select File',
                  style: textStyle ??
                      theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
