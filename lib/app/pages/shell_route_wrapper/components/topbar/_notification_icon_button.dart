part of '_topbar.dart';

class NotificationIconButton extends StatefulWidget {
  const NotificationIconButton({
    super.key,
    this.notificationCount = 0,
  });

  final int notificationCount;

  @override
  State<NotificationIconButton> createState() => _NotificationIconButtonState();
}

class _NotificationIconButtonState extends State<NotificationIconButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dropdownStyle = FinanceDropdownStyle(context);

    return DropdownButton2(
      underline: const SizedBox.shrink(),
      customButton: _buildButton(context),
      dropdownStyleData: dropdownStyle.dropdownStyle.copyWith(
        width: responsiveValue<double>(
          context,
          xs: 380,
          md: 425,
        ),
        maxHeight: 425,
        offset: const Offset(0, -24),
        scrollbarTheme: theme.scrollbarTheme.copyWith(
          thumbVisibility: WidgetStateProperty.all<bool>(false),
          trackVisibility: WidgetStateProperty.all<bool>(false),
        ),
      ),
      menuItemStyleData: dropdownStyle.menuItemStyle.copyWith(
        height: responsiveValue<double?>(
          context,
          xs: null,
          lg: 72,
        ),
      ),
      items: List.generate(
        30,
        (index) {
          return DropdownMenuItem(
            value: index,
            child: const NotifiactionTile(),
          );
        },
      ),
      onChanged: (value) {},
    );
  }

  Widget _buildButton(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final size = constraints.biggest;
        return SizedBox.square(
          dimension: size.height / 2,
          child: Stack(
            children: [
              const Center(
                child: Icon(
                  Icons.notifications_none_sharp,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                height: size.height / 3.74,
                width: size.height / 3.74,
                child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Text(
                    widget.notificationCount.toString(),
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 10,
                      color: theme.colorScheme.onError,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class NotifiactionTile extends StatelessWidget {
  const NotifiactionTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        AvatarWidget(
          fullName: 'A C',
          initialsOnly: true,
          backgroundColor: theme.colorScheme.primary.withOpacity(0.20),
          foregroundColor: theme.colorScheme.primary,
          size: responsiveValue<Size?>(
            context,
            xs: const Size.square(38),
            lg: const Size.square(44),
          ),
        ),
        SizedBox(
          width: responsiveValue<double>(
            context,
            xs: 8,
            md: 12,
            lg: 16,
          ),
        ),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              border: BorderDirectional(
                bottom: BorderSide(color: theme.colorScheme.outline),
              ),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              title: const Text('Androw Cremer'),
              titleTextStyle: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              subtitle: const Text('New Comment'),
              subtitleTextStyle: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onTertiaryContainer,
              ),
              trailing: const Text('30 Mins ago'),
              leadingAndTrailingTextStyle: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onTertiaryContainer,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
