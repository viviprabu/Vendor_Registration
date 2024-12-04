// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '../../core/helpers/fuctions/helper_functions.dart';
import '../../core/static/static.dart';

class FileExportButton extends StatelessWidget {
  const FileExportButton._({
    super.key,
    required this.onPressed,
    required this.iconPath,
  });
  final void Function()? onPressed;
  final String iconPath;

  const FileExportButton.excel({
    Key? key,
    void Function()? onPressed,
  }) : this._(
          key: key,
          onPressed: onPressed,
          iconPath: FinanceSVGIcons.excelIcon,
        );

  const FileExportButton.csv({
    Key? key,
    void Function()? onPressed,
  }) : this._(
          key: key,
          onPressed: onPressed,
          iconPath: FinanceSVGIcons.csvIcon,
        );

  const FileExportButton.print({
    Key? key,
    void Function()? onPressed,
  }) : this._(
          key: key,
          onPressed: onPressed,
          iconPath: FinanceSVGIcons.printIcon,
        );

  const FileExportButton.pdf({
    Key? key,
    void Function()? onPressed,
  }) : this._(
          key: key,
          onPressed: onPressed,
          iconPath: FinanceSVGIcons.pdfIcon,
        );

  const FileExportButton.copy({
    Key? key,
    void Function()? onPressed,
  }) : this._(
          key: key,
          onPressed: onPressed,
          iconPath: FinanceSVGIcons.copyIcon,
        );

  const FileExportButton.custom({
    Key? key,
    void Function()? onPressed,
    required String iconPath,
  }) : this._(
          key: key,
          onPressed: onPressed,
          iconPath: iconPath,
        );

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      hoverColor: Colors.transparent,
      padding: EdgeInsets.zero,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      icon: Container(
        constraints: BoxConstraints.loose(const Size.square(24)),
        child: getImageType(
          iconPath,
          height: double.maxFinite,
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
