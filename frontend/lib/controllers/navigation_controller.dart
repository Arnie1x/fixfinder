import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController instance = Get.find();
  final GlobalKey<NavigatorState> primaryNavigationKey = GlobalKey();
  final GlobalKey<BeamerState> mainBeamerKey = GlobalKey();
  final GlobalKey<BeamerState> nestedBeamerKey = GlobalKey();
  final GlobalKey<BeamerState> authBeamerKey = GlobalKey();
  late int lastSelectedIndex = 0;

  navigateTo(context, String routeName) {
    print(routeName);
    Beamer.of(context).beamToNamed(routeName);
    // nestedBeamerKey.currentState?.routerDelegate.beamToNamed(routeName);
  }

  // navigateToIndex(context, int routeIndex) {
  //   Beamer.of(context).beamToNamed(destinations
  //       .firstWhere((element) => element.pageNumber == routeIndex)
  //       .route);
  //   // nestedBeamerKey.currentState?.routerDelegate.beamToNamed(destinations.firstWhere((element) => element.pageNumber == routeIndex).route);
  // }

  // navigateToIndexMobile(context, int routeIndex) {
  //   Beamer.of(context).beamToNamed(mobileDestinations
  //       .firstWhere((element) => element.pageNumber == routeIndex)
  //       .route);
  //   // nestedBeamerKey.currentState?.routerDelegate.beamToNamed(destinations.firstWhere((element) => element.pageNumber == routeIndex).route);
  // }

  // RxInt selectedIndex(RxString path) {
  //   if (destinations
  //           .firstWhere((element) => element.route == path.value,
  //               orElse: () => CustomNavigationDestination(
  //                   pageNumber: -1,
  //                   label: 'Ignore',
  //                   icon: CustomIcons.homeRounded))
  //           .pageNumber >
  //       -1) {
  //     lastSelectedIndex = destinations
  //         .firstWhere((element) => element.route == path.value)
  //         .pageNumber;
  //   }
  //   return lastSelectedIndex.obs;
  // }

  // // ! The Navigation Bar is bringing errors with the New Record Pages
  // RxInt selectedIndexMobile(RxString path) {
  //   if (mobileDestinations
  //           .firstWhere((element) => element.route == path.value,
  //               orElse: () => CustomNavigationDestination(
  //                   pageNumber: 1,
  //                   label: 'Ignore',
  //                   icon: CustomIcons.homeRounded))
  //           .pageNumber >
  //       -1) {
  //     lastSelectedIndex = destinations
  //         .firstWhere((element) => element.route == path.value)
  //         .pageNumber;
  //   }
  //   // Extremely Janky solution to fix navigation bar issues.
  //   // Will work for the time being
  //   if (lastSelectedIndex > 1) lastSelectedIndex -= 7;
  //   return lastSelectedIndex.obs;
  // }

  // goBack(context) => Beamer.of(context).beamBack();
}
