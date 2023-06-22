import 'package:beamer/beamer.dart';
import 'package:fixfinder/controllers/navigation_controller.dart';
import 'package:fixfinder/routes/routes.dart';

// Navigator localNavigator() => Navigator(
//   // Create a new Navigator Key for local navigation
//   key: NavigationController.instance.primaryNavigationKey,
//   initialRoute: Routes.homeRoute,
//   onGenerateRoute: generateRoute
// );

// * This beamer navigator is for all the main routes starting from *
Beamer beamerNavigator() => Beamer(
      // key: NavigationController.instance.nestedBeamerKey,
      routerDelegate: BeamerDelegate(
          transitionDelegate: const NoAnimationTransitionDelegate(),
          locationBuilder: RoutesLocationBuilder(routes: Routes.beamerRoutes)),
    );

// * This beamer navigator is for all the auth routes starting with /auth
Beamer authBeamerNavigator() => Beamer(
      key: NavigationController.instance.authBeamerKey,
      routerDelegate: BeamerDelegate(
          // transitionDelegate: const NoAnimationTransitionDelegate(),
          locationBuilder:
              RoutesLocationBuilder(routes: Routes.authBeamerRoutes)),
    );