part of '_topbar.dart';

class UserProfileAvatar extends StatelessWidget {
  String? userName;
  String? roleName;
  UserProfileAvatar({super.key, this.userName, this.roleName});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dropdownStyle = FinanceDropdownStyle(context);

    context.read<AuthBloc>().add(GetAuthenicatedUserEvent());

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (authContext, authState) {
        if (authState is GetAuthenicatedUserState) {
          userName = authState.user.name;
          roleName = authState.user.roleName;
        }

        return ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(60),
          child: DropdownButton2(
            underline: const SizedBox.shrink(),
            customButton: _buildButton(context),
            dropdownStyleData: dropdownStyle.dropdownStyle.copyWith(
              width: responsiveValue<double>(
                context,
                xs: 200,
                md: 246,
              ),
              maxHeight: 425,
              offset: const Offset(0, -24),
              scrollbarTheme: theme.scrollbarTheme.copyWith(
                thumbVisibility: WidgetStateProperty.all<bool>(false),
                trackVisibility: WidgetStateProperty.all<bool>(false),
              ),
            ),
            menuItemStyleData: dropdownStyle.menuItemStyle.copyWith(
              customHeights: [60, 48, 48],
              padding: EdgeInsets.zero,
            ),
            items: [
              // Profile Tile
              DropdownMenuItem<String>(
                value: 'user_profile',
                child: _DropdownItemWrapper(
                  child: ListTile(
                    visualDensity: const VisualDensity(
                      horizontal: -4,
                      vertical: -4,
                    ),
                    contentPadding: EdgeInsets.zero,
                    title: Text(userName ?? 'Sample User'),
                    titleTextStyle: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    subtitle: Text(roleName ?? 'Sample Role'),
                    subtitleTextStyle: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onTertiaryContainer,
                    ),
                  ),
                ),
              ),

              ...{
                "Profile": FeatherIcons.user,
                "Logout": FeatherIcons.power,
              }.entries.toList().asMap().entries.map((item) {
                return DropdownMenuItem(
                  value: item.key,
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: _DropdownItemWrapper(
                      child: ListTile(
                        key: ValueKey(item.value),
                        visualDensity: const VisualDensity(
                          horizontal: -4,
                          vertical: -4,
                        ),
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(item.value.value, size: 20),
                        title: Text(item.value.key),
                        titleTextStyle: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.onTertiaryContainer,
                        ),
                      ),
                    ),
                  ),
                );
              })
            ],
            onChanged: (value) {
              if (value == 1) {
                authContext.read<AuthBloc>().add(AuthSignOutEvent());
              } else if (value == 0) {
                context.go('/users/user-profile');
              }
            },
          ),
        );
      },
    );
  }

  Widget _buildButton(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final size = constraints.biggest;
        return SizedBox.square(
          dimension: size.height / 2,
          child: const AvatarWidget(
            imagePath:
                'assets/images/static_images/avatars/placeholder_avatar/placeholder_avatar_01.png',
          ),
        );
      },
    );
  }
}

class _DropdownItemWrapper extends StatelessWidget {
  const _DropdownItemWrapper({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
            color: theme.colorScheme.outline,
          ),
        ),
      ),
      child: child,
    );
  }
}
