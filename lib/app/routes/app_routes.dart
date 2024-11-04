// 📦 Package imports:
import 'package:finance_app/app/features/auth/presentation/pages/signup_view.dart';
import 'package:finance_app/app/features/sector/presentation/pages/sectors_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 🌎 Project imports:
import '../features/pages.dart';

abstract class FinanceAppRoutes {
  //--------------Navigator Keys--------------//
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  /* static final _emailShellNavigatorKey = GlobalKey<NavigatorState>(); */
  //--------------Navigator Keys--------------//

  static const _initialPath = '/';
  static final routerConfig = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    initialLocation: _initialPath,
    routes: [
      // Landing Route Handler
      GoRoute(
        path: _initialPath,
        redirect: (context, state) {
          return '/authentication/signin';
        },
      ),

      // Global Shell Route
      ShellRoute(
        navigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state, child) {
          return NoTransitionPage(
            child: ShellRouteWrapper(child: child),
          );
        },
        routes: [
          // Dashboard Routes
          GoRoute(
            path: '/dashboard',
            redirect: (context, state) async {
              if (state.fullPath == '/dashboard') {
                return '/dashboard';
              }
              return null;
            },
            routes: [
              GoRoute(
                path: 'home',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ECommerceAdminDashboardView(),
                ),
              ),
            ],
          ),

          // Users Route
          GoRoute(
            path: '/users',
            redirect: (context, state) async {
              if (state.fullPath == '/users') {
                return '/users/user-list';
              }
              return null;
            },
            routes: [
              GoRoute(
                path: 'user-list',
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: UsersListView(),
                ),
              ),
              GoRoute(
                path: 'user-grid',
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: UsersGridView(),
                ),
              ),
              GoRoute(
                path: 'user-profile',
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: UserProfileView(),
                ),
              ),
            ],
          ),

          // Sectors Route
          GoRoute(
            path: '/master',
            redirect: (context, state) async {
              if (state.fullPath == '/master') {
                return '/sectors/list-sectors';
              }
              return null;
            },
            routes: [
              GoRoute(
                path: 'list-sectors',
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: SectorsListView(),
                ),
              ),
            ],
          ),

          //--------------Application Section--------------//
        ],
      ),
      GoRoute(
        path: '/authentication/signin',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SigninView(),
        ),
      ),

      // GoRoute(
      //   path: '/authentication/signup',
      //   name: 'signup',
      //   pageBuilder: (context, state) => NoTransitionPage(
      //     child: SignupView(),
      //   ),
      // ),

      GoRoute(
        path: '/authentication/signout',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SigninView(),
        ),
      )
    ],
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: NotFoundView(),
    ),
  );
}
