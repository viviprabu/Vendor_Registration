part of '../_multi_select_field.dart';

class FinanceMultiSelectDropdown<T> extends StatefulWidget {
  FinanceMultiSelectDropdown({
    super.key,
    this.decoration,
    this.menuItemStyleData,
    this.buttonStyleData,
    this.iconStyleData,
    this.dropdownStyleData,
    required this.items,
    this.values,
    this.onChanged,
  }) : assert(
          items.isEmpty ||
              values == null ||
              items.where((item) {
                    return values.contains(item.value);
                  }).length ==
                  values.length,
          "There should be exactly one item with [FinanceMultiSelectDropdown]'s value in the items list. "
          'Either zero or 2 or more [MultiSelectDropdownMenuItem]s were detected with the same value',
        );

  final List<MultiSelectDropdownMenuItem<T?>> items;
  final List<T?>? values;
  final void Function(List<T>? values)? onChanged;

  final InputDecoration? decoration;
  final MenuItemStyleData? menuItemStyleData;
  final ButtonStyleData? buttonStyleData;
  final IconStyleData? iconStyleData;
  final DropdownStyleData? dropdownStyleData;

  @override
  State<FinanceMultiSelectDropdown<T>> createState() =>
      _FinanceMultiSelectDropdownState<T>();
}

class _FinanceMultiSelectDropdownState<T>
    extends State<FinanceMultiSelectDropdown<T>> {
  bool isOpen = false;
  void listenMenuChange(bool value) {
    setState(() {
      isOpen = value;
      if (!value) {
        widget.onChanged?.call(
          selectedItems.map((e) => e.value!).toList(),
        );
      }
    });
  }

  late List<MultiSelectDropdownMenuItem<T?>> selectedItems;

  @override
  void initState() {
    super.initState();
    selectedItems = widget.items
        .where((element) => widget.values?.contains(element.value) ?? false)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return DropdownButtonFormField2<T>(
      decoration: (widget.decoration ?? const InputDecoration()).copyWith(
        hintText: '',
      ),
      menuItemStyleData: widget.menuItemStyleData ?? const MenuItemStyleData(),
      buttonStyleData: widget.buttonStyleData ?? const ButtonStyleData(),
      iconStyleData: widget.iconStyleData ?? const IconStyleData(),
      dropdownStyleData: widget.dropdownStyleData ?? const DropdownStyleData(),
      onMenuStateChange: listenMenuChange,
      customButton: _buildCustomButton(context),
      items: widget.items.map((item) {
        return DropdownMenuItem<T>(
          value: item.value,
          enabled: false,
          child: _buildMenuItem(context, item, _theme),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }

  Widget _buildCustomButton(BuildContext context) {
    const _itemPadding = EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 4,
    );
    if (selectedItems.isEmpty) {
      final _iconWidget =
          widget.iconStyleData?.icon ?? Icon(MdiIcons.chevronDown);
      return Padding(
        padding: _itemPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.decoration?.hintText ?? 'Select items',
              style: widget.decoration?.hintStyle,
            ),
            _iconWidget,
          ],
        ),
      );
    }
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.touch,
        },
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: selectedItems.reversed.map((item) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SelectedItemButton(
                padding: _itemPadding,
                labelText: item.labelText,
                onTap: () => setState(() => selectedItems.remove(item)),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    MultiSelectDropdownMenuItem<T?> item,
    ThemeData _theme,
  ) {
    return StatefulBuilder(
      builder: (context, itemState) {
        final _isSelected = selectedItems.contains(item);
        return InkWell(
          onTap: () {
            _isSelected ? selectedItems.remove(item) : selectedItems.add(item);
            setState(() {});
            itemState(() {});
          },
          child: Container(
            constraints: const BoxConstraints(minHeight: 48),
            alignment: AlignmentDirectional.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(item.labelText),
                ),
                if (_isSelected)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: _theme.primaryColor,
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MultiSelectDropdownMenuItem<T> {
  MultiSelectDropdownMenuItem({
    required this.labelText,
    this.value,
  });
  final String labelText;
  final T? value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MultiSelectDropdownMenuItem<T> &&
          runtimeType == other.runtimeType &&
          labelText == other.labelText &&
          value == other.value;

  @override
  int get hashCode => labelText.hashCode ^ value.hashCode;
}
