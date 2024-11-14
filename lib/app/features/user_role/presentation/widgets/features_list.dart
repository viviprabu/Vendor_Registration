import 'package:flutter/material.dart';

class FeaturesList extends StatelessWidget {
  final String name;
  final List<bool> permissions;
  final Function(int, bool) onChanged;
  const FeaturesList({
    super.key,
    required this.name,
    required this.permissions,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Row(
        children: [
          Text(name),
          ...permissions.asMap().entries.map((entry) {
            int index = entry.key;
            bool value = entry.value;
            return Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                onChanged(index, newValue ?? false);
              },
            );
          }),
        ],
      ),
    );
  }
}
