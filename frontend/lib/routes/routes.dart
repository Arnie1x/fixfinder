import 'package:beamer/beamer.dart';
import 'package:fixfinder/pages/auth/auth.dart';
import 'package:fixfinder/pages/auth/login/login.dart';
import 'package:fixfinder/pages/auth/register/register.dart';
import 'package:fixfinder/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Routes {
  static const String loginRoute = '/auth';
  static const String registrationRoute = '/auth/register';
  static const String registrationEmailVerificationRoute =
      '/auth/register/verify-email';
  static const String passwordResetRoute = '/auth/user/password-reset';
  static const String passwordResetConfirmationRoute =
      '/auth/user/password-reset/confirm';
  static const String passwordChangeRoute = '/auth/user/password-change';

  static const String accountRoute = '/account';

  static const String homeRoute = '/';

  static StorageService storageService = Get.find();

  static List<BeamGuard> guards = [
    BeamGuard(
      pathPatterns: ['/auth', '/auth/*'],
      guardNonMatching: true,
      check: (context, location) => storageService.box.read('access') != null,
      beamToNamed: (origin, target) => '/auth',
    )
  ];

  static BeamerDelegate routerDelegate = BeamerDelegate(
      transitionDelegate: const NoAnimationTransitionDelegate(),
      locationBuilder: RoutesLocationBuilder(routes: {
        '/auth': (context, state, data) => const BeamPage(
            key: ValueKey('auth'),
            title: 'Authentication: FixFinder',
            child: AuthPage()),
        '*': (context, state, data) =>
            const BeamPage(key: ValueKey('main'), child: Placeholder()),
      }),
      guards: guards);

  static Map<Pattern, dynamic Function(BuildContext, BeamState, Object?)>
      authBeamerRoutes = {
    loginRoute: (context, state, data) => const BeamPage(
        key: ValueKey('login'), title: 'Login: FixFinder', child: LoginPage()),
    registrationRoute: (context, state, data) => const BeamPage(
        key: ValueKey('register'),
        title: 'Register: FixFinder',
        child: RegisterPage()),
    accountRoute: (context, state, data) => const BeamPage(
        key: ValueKey('account'),
        title: 'Account: FixFinder',
        child: Placeholder()),
  };

  static Map<Pattern, dynamic Function(BuildContext, BeamState, Object?)>
      beamerRoutes = {
    homeRoute: (context, state, data) => const BeamPage(
        key: ValueKey('home'), title: 'Home: FixFinder', child: Placeholder()),
  };
}
