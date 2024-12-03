// 🐦 Flutter imports:
import 'package:vendor_registration/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 📦 Package imports:
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;

// 🌎 Project imports:
import '../../core/static/static.dart';
import '../../core/theme/theme.dart';
import 'components/_components.dart';
import 'models/models.dart';

class ShellRouteWrapper extends StatefulWidget {
  const ShellRouteWrapper({super.key, required this.child});

  final Widget child;

  @override
  State<ShellRouteWrapper> createState() => _ShellRouteWrapperState();
}

class _ShellRouteWrapperState extends State<ShellRouteWrapper> {
  late AuthBloc authBloc;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLargeSidebarExpaned = true;

  @override
  void initState() {
    isUserSignedIn();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.sizeOf(context);
    final isLaptop = rf.ResponsiveBreakpoints.of(context).largerThan(
      BreakpointName.MD.name,
    );
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor:
          isDark ? FinanceAppColors.kDark1 : FinanceAppColors.kPrimary50,
      drawer: mqSize.width > 1240
          ? null
          : buildSidebar(isLaptop && isLargeSidebarExpaned),
      bottomNavigationBar: isLaptop ? null : const FooterWidget(),
      body: rf.ResponsiveRowColumn(
        layout: rf.ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Laptop & Desktop Sidebar

          if (isLaptop)
            rf.ResponsiveRowColumnItem(
              columnFit: FlexFit.loose,
              child: buildSidebar(!isLargeSidebarExpaned),
            ),

          // Main Content
          rf.ResponsiveRowColumnItem(
            rowFit: FlexFit.tight,
            child: rf.ResponsiveRowColumn(
              layout: rf.ResponsiveRowColumnType.COLUMN,
              children: [
                // Static Topbar
                rf.ResponsiveRowColumnItem(
                  child: buildTopbar(isLaptop),
                ),

                // Route Breadcrumb Widget
                rf.ResponsiveRowColumnItem(
                  child: Padding(
                    padding: rf.ResponsiveValue<EdgeInsetsGeometry>(
                      context,
                      conditionalValues: [
                        rf.Condition.smallerThan(
                          name: BreakpointName.LG.name,
                          value: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        )
                      ],
                      defaultValue: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    ).value,
                    child: RouteBreadcrumbWidget(
                      breadcrumbModel: _getCurrentRouterParam(context),
                    ),
                  ),
                ),

                // Route Pages
                rf.ResponsiveRowColumnItem(
                  columnFit: FlexFit.tight,
                  child: widget.child,
                ),

                // Footer
                if (isLaptop)
                  const rf.ResponsiveRowColumnItem(
                    child: FooterWidget(),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget buildTopbar(bool isLaptop) {
    if (isLaptop) scaffoldKey.currentState?.closeDrawer();
    return TopBarWidget(
      onMenuTap: () {
        if (isLaptop) {
          setState(() => isLargeSidebarExpaned = !isLargeSidebarExpaned);
        } else {
          return scaffoldKey.currentState?.openDrawer();
        }
      },
    );
  }

  Widget buildSidebar(bool isExpanded) {
    return SideBarWidget(
      rootScaffoldKey: scaffoldKey,
      iconOnly: isExpanded,
    );
  }

  RouteBreadcrumbModel _getCurrentRouterParam(BuildContext context) {
    return routerParam[GoRouterState.of(context).matchedLocation] ??
        const RouteBreadcrumbModel(
          title: 'N/A',
          parentRoute: 'N/A',
          childRoute: 'N/A',
        );
  }

  // check if user is signed in using shared preferences

  Future<void> isUserSignedIn() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString('token');
    if (token == null) {
      GoRouter.of(context).go('/authentication/signin');
    }
  }
}
