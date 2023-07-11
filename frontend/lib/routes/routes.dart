import 'package:beamer/beamer.dart';
import 'package:fixfinder/helpers/layout/site_layout.dart';
import 'package:fixfinder/pages/account/technician/form.dart';
import 'package:fixfinder/pages/account/technician/technician.dart';
import 'package:fixfinder/pages/auth/auth.dart';
import 'package:fixfinder/pages/auth/login/login.dart';
import 'package:fixfinder/pages/auth/register/register.dart';
import 'package:fixfinder/pages/chats/home.dart';
import 'package:fixfinder/pages/home/home.dart';
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

  static const String editRoute = 'edit';
  static const String newRoute = 'new';

  static const String homeRoute = '/';
  static const String technicianAccountRoute = '/technician';

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
          const BeamPage(key: ValueKey('main'), child: SiteLayout()),
    }),
    // guards: guards
  );

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
        key: ValueKey('home'), title: 'Home: FixFinder', child: HomePage()),
    '$technicianAccountRoute/:id': (context, state, data) => BeamPage(
        key: ValueKey('technician-${state.pathParameters['id']}'),
        title: 'Technician ${state.pathParameters['id']}: FixFinder',
        child: TechnicianAccountPage(
          route: state.uri.path,
          id: state.pathParameters['id'] ?? '-1',
        )),
    '$technicianAccountRoute/:id/$editRoute': (context, state, data) =>
        BeamPage(
            key: ValueKey('technician-edit-${state.pathParameters['id']}'),
            title: 'Technician ${state.pathParameters['id']}: FixFinder',
            child: TechnicianFormPage(
              id: int.parse(state.pathParameters['id']!),
            )),
  };
  static Map<Pattern, dynamic Function(BuildContext, BeamState, Object?)>
      messagesBeamerRoutes = {
    homeRoute: (context, state, data) => const BeamPage(
        key: ValueKey('home'), title: 'Home: FixFinder', child: ChatHomePage()),
  };
}
