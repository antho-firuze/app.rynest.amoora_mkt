import 'package:amoora_mkt/cff/views/walkthrough_view.dart';
import 'package:amoora_mkt/features/user/views/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:amoora_mkt/cff/views/router_view.dart';
import 'package:amoora_mkt/cff/views/landing_view.dart';
import 'package:amoora_mkt/cff/views/splash_view.dart';
import 'package:amoora_mkt/features/user/views/home_view.dart';
import 'package:amoora_mkt/features/user/views/profile_view.dart';
import 'package:amoora_mkt/features/user/views/registration/registration_view.dart';
import 'package:amoora_mkt/features/user/views/participant_view.dart';

// Private Navigators
final rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _dashboardNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'dashboard');
final _participantNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'participant');
final _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

final goRouterProvider = Provider<GoRouter>((ref) => router);

final GoRouter router = GoRouter(
  initialLocation: SplashView.routeName,
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: false,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => RouterView(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              path: HomeView.routeName,
              pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const HomeView()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _dashboardNavigatorKey,
          routes: [
            GoRoute(
              path: RegistrationView.routeName,
              pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const DashboardView()),
            ),
          ],
        ),
        // Dummy Page on Center
        // StatefulShellBranch(
        //   // navigatorKey: _alertNavigatorKey,
        //   routes: [
        //     GoRoute(
        //       path: '/',
        //       pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: Container()),
        //     ),
        //   ],
        // ),
        StatefulShellBranch(
          navigatorKey: _participantNavigatorKey,
          routes: [
            GoRoute(
              path: ParticipantView.routeName,
              pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const ParticipantView()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _profileNavigatorKey,
          routes: [
            GoRoute(
              path: ProfileView.routeName,
              pageBuilder: (context, state) => NoTransitionPage(key: state.pageKey, child: const ProfileView()),
            ),
          ],
        ),
      ],
    ),
    // COMMON PAGES
    GoRoute(path: SplashView.routeName, builder: (context, state) => const SplashView()),
    GoRoute(path: LandingView.routeName, builder: (context, state) => const LandingView()),
    GoRoute(path: WalkthroughView.routeName, builder: (context, state) => const WalkthroughView()),
  ],
);
