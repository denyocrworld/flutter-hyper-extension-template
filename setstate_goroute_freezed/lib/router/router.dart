import 'package:fhe_template/core.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'no_transition.dart';

getRouters(context, rootNavigatorKey, shellNavigatorKey) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/dashboard',
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return MainNavigationView(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/dashboard',
            pageBuilder: (context, state) => noTransition(
              context: context,
              state: state,
              child: const DashboardView(),
            ),
          ),
          GoRoute(
            path: '/customers',
            pageBuilder: (context, state) => noTransition(
              context: context,
              state: state,
              child: const CustomerListView(),
            ),
          ),
          GoRoute(
            path: '/products',
            pageBuilder: (context, state) => noTransition(
              context: context,
              state: state,
              child: const ProductListView(),
            ),
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) => noTransition(
              context: context,
              state: state,
              child: const ProfileView(),
            ),
          ),
          GoRoute(
            path: '/orders',
            pageBuilder: (context, state) => noTransition(
              context: context,
              state: state,
              child: const OrderListView(),
            ),
          ),
          GoRoute(
            path: '/reports',
            pageBuilder: (context, state) => noTransition(
              context: context,
              state: state,
              child: const ReportView(),
            ),
          ),
          GoRoute(
            path: '/settings',
            pageBuilder: (context, state) => noTransition(
              context: context,
              state: state,
              child: const SettingView(),
            ),
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) => noTransition(
              context: context,
              state: state,
              child: const ProfileView(),
            ),
          ),
        ],
      ),
    ],
  );
}
