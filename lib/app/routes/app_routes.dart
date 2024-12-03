// 📦 Package imports:
import 'package:vendor_registration/app/features/auth/domain/entities/user_rights.dart';
import 'package:vendor_registration/app/features/auth/presentation/pages/services_view.dart';
import 'package:vendor_registration/app/features/registration/presentation/pages/departments_page.dart';
import 'package:vendor_registration/app/features/user/presentation/pages/user_list/_unauthorised_users_list_view.dart';
import 'package:vendor_registration/app/features/user_role/presentation/pages/user_role_list/_user_roles_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 🌎 Project imports:
import '../features/pages.dart';

abstract class FinanceAppRoutes {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
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
                path: '/home',
                name: 'home',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ECommerceAdminDashboardView(),
                ),
                /* builder: (context, state) => ECommerceAdminDashboardView(
                  appId: state.uri.queryParameters['appId'],
                ), */
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
                path: 'unauthorised-users',
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: UnAuthorisedUsersListView(),
                ),
              ),
              GoRoute(
                path: 'user-role-list',
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: UserRolesListView(),
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
                return '/departments/list-departments';
              }
              return null;
            },
            routes: [
              GoRoute(
                path: 'list-departments',
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: DepartmentsListView(),
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

      GoRoute(
          path: '/authentication/services',
          name: 'services',
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: ServicesView(),
            );
          }),

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
