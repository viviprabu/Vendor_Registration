// 📦 Package imports:
import 'package:finance_app/app/features/initial_upload/presentation/pages/initial_upload_list/_initial_upload.dart';
import 'package:finance_app/app/features/initial_upload/presentation/pages/initial_upload_list/_initial_upload_list_view.dart';
import 'package:finance_app/app/features/section/presentation/pages/sections_page.dart';
import 'package:finance_app/app/features/services/presentation/pages/appsetting_grid/_appsettings_grid_view.dart';
import 'package:finance_app/app/features/department/presentation/pages/departments_page.dart';
import 'package:finance_app/app/features/sector/presentation/pages/sectors_page.dart';
import 'package:finance_app/app/features/user/presentation/pages/user_list/_unauthorised_users_list_view.dart';
import 'package:finance_app/app/features/user_role/presentation/pages/user_role_list/_user_roles_list_view.dart';
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
                path: 'home',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ECommerceAdminDashboardView(),
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/uploads',
            redirect: (context, state) async {
              if (state.fullPath == '/uploads') {
                return '/uploads/excel_upload';
              }
              return null;
            },
            routes: [
              GoRoute(
                path: 'excel_upload',
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: InitialUploadPage(),
                ),
              ),
              GoRoute(
                path: 'uploads_list',
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: InitialUploadListView(),
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
          GoRoute(
            path: '/master',
            redirect: (context, state) async {
              if (state.fullPath == '/master') {
                return '/sections/list-sections';
              }
              return null;
            },
            routes: [
              GoRoute(
                path: 'list-sections',
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: SectionsListView(),
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
        path: '/authentication/services_list',
        name: 'services_list',
        pageBuilder: (context, state) => NoTransitionPage(
          child: AppSettingGridView(),
        ),
      ),

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
