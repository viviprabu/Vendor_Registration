import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../core/theme/_app_colors.dart';

class ToggleSwitcher extends StatefulWidget {
  final String activeText;
  final String inactiveText;
  final ValueChanged<int?> onToggle;
  final int initialLabelIndex; 
  const ToggleSwitcher({
    super.key,
    this.activeText = 'Active',
    this.inactiveText = 'Inactive',
    required this.onToggle,
    this.initialLabelIndex = 0,
  });

  @override
  State<ToggleSwitcher> createState() => _ToggleSwitcherState();
}

class _ToggleSwitcherState extends State<ToggleSwitcher> {
  late int initialLabelIndex;

  @override
  void initState() {
    initialLabelIndex = widget.initialLabelIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 100.0,
      cornerRadius: 20.0,
      initialLabelIndex: initialLabelIndex,
      activeBgColor: [FinanceAppColors.kPrimary600],
      activeFgColor: FinanceAppColors.kWhiteColor,
      inactiveBgColor: FinanceAppColors.kPrimary50,
      inactiveFgColor: FinanceAppColors.kBlackColor,
      totalSwitches: 2,
      labels: [widget.activeText, widget.inactiveText],
      icons: [Icons.check, Icons.close],
      onToggle: (index) {
        //print('switched to: $index');
        setState(() {
          initialLabelIndex = index!;
        });
        widget.onToggle(index);
      },
    );
  }
}
