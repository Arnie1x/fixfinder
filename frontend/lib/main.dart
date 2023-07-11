import 'package:beamer/beamer.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:fixfinder/constants/color_schemes.g.dart';
import 'package:fixfinder/controllers/navigation_controller.dart';
import 'package:fixfinder/routes/routes.dart';
import 'package:fixfinder/services/auth_service.dart';
import 'package:fixfinder/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  Beamer.setPathUrlStrategy();

  await initServices();
  runApp(const MyApp());
  Get.put(NavigationController());
}

initServices() async {
  // Starting Services
  await Get.putAsync(() => StorageService().init());
  await Get.putAsync(() => AuthService().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: Routes.routerDelegate,
      backButtonDispatcher:
          BeamerBackButtonDispatcher(delegate: Routes.routerDelegate),
      title: "FixFinder",
      themeMode: ThemeMode.light,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ).copyWith(
              // bodyLarge: Theme.of(context)
              //     .textTheme
              //     .bodyLarge
              //     ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
              // bodyMedium: Theme.of(context)
              //     .textTheme
              //     .bodyMedium
              //     ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
              // bodySmall: Theme.of(context)
              //     .textTheme
              //     .bodySmall
              //     ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
              // headlineLarge: Theme.of(context)
              //     .textTheme
              //     .headlineLarge
              //     ?.copyWith(color: Theme.of(context).colorScheme.secondary),
              // headlineMedium: Theme.of(context)
              //     .textTheme
              //     .headlineMedium
              //     ?.copyWith(color: Theme.of(context).colorScheme.secondary),
              // headlineSmall: Theme.of(context)
              //     .textTheme
              //     .headlineSmall
              //     ?.copyWith(color: Theme.of(context).colorScheme.secondary),
              )),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          )),
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}
