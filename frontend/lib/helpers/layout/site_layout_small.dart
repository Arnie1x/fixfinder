import 'package:fixfinder/helpers/local_navigator.dart';
import 'package:flutter/material.dart';

class SiteLayoutSmall extends StatelessWidget {
  const SiteLayoutSmall({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {},
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.messenger_outline_rounded),
            selectedIcon: Icon(Icons.messenger),
            label: 'Messages',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle_outlined),
            selectedIcon: Icon(Icons.account_circle_rounded),
            label: 'Account',
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: beamerNavigator(),
      ),
    );
  }
}
