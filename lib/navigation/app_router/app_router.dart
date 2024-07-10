import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/route_constants.dart';
import '../../features/home/screen/home_screen.dart';
import '../../features/main/screen/main_screen.dart';
import '../../features/splash/screen/splash_screen.dart';
import 'services/route_logger.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  RouterLogger get logger => RouterLogger();

  GoRouter get router => _router;

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  final GoRouter _router = GoRouter(
    navigatorKey: _navigatorKey,
    observers: <NavigatorObserver>[RouterLogger()],
    initialLocation: RouterConstants.splashRoute,
    // redirect: (BuildContext context, GoRouterState state) {
    //   if (!appLocator<AuthService>().isAuthenticated) {
    //     return RouterConstants.authRoute;
    //   } else {
    //     return null;
    //   }
    // },
    routes: <RouteBase>[
      GoRoute(
        path: RouterConstants.splashRoute,
        name: RouterConstants.splashRoute,
        builder: (BuildContext context, GoRouterState state) => SplashScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) =>
            MainScreen(navigationShell: navigationShell),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: RouterConstants.homeRoute,
                name: RouterConstants.homeRoute,
                builder: (BuildContext context, GoRouterState state) => HomeScreen(),
                // routes: <RouteBase>[
                //   GoRoute(
                //     parentNavigatorKey: _navigatorKey,
                //     path: RouterConstants.videoTutorialsRoute,
                //     name: RouterConstants.videoTutorialsRoute,
                //     builder: (BuildContext context, GoRouterState state) => VideoTutorialsScreen(),
                //   ),
                // ],
              ),
            ],
          ),
          // StatefulShellBranch(
          //   routes: <RouteBase>[
          //     GoRoute(
          //       path: RouterConstants.chatRoute,
          //       name: RouterConstants.chatRoute,
          //       builder: (BuildContext context, GoRouterState state) => ChatScreen(),
          //     ),
          //   ],
          // ),
          // StatefulShellBranch(
          //   routes: <RouteBase>[
          //     GoRoute(
          //       path: RouterConstants.settingsRoute,
          //       name: RouterConstants.settingsRoute,
          //       builder: (BuildContext context, GoRouterState state) => SettingsScreen(),
          //       routes: <RouteBase>[
          //         GoRoute(
          //           parentNavigatorKey: _navigatorKey,
          //           path: RouterConstants.settingsEditingRoute,
          //           name: RouterConstants.settingsEditingRoute,
          //           builder: (BuildContext context, GoRouterState state) => EditProfileScreen(),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
        ],
      ),
    ],
  );
}
//
// final GoRoute _bottomSheetRoute = GoRoute(
//   parentNavigatorKey: _navigatorKey,
//   path: RouterConstants.modalRoute,
//   name: RouterConstants.modalRoute,
//   pageBuilder: (BuildContext context, GoRouterState state) {
//     return BottomSheetDialogPage<dynamic>(
//       builder: (_) => const BaseBottomSheetWidget(
//         titleText: 'Title',
//         alertText: 'Content',
//       ),
//     );
//   },
// );
