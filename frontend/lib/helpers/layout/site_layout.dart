import 'package:fixfinder/helpers/layout/site_layout_large.dart';
import 'package:fixfinder/helpers/layout/site_layout_small.dart';
import 'package:flutter/widgets.dart';

const int largeScreenSize = 1440;
const int smallScreenSize = 600;

class SiteLayout extends StatelessWidget {
  const SiteLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < largeScreenSize) {
        return const SiteLayoutSmall();
      } else {
        return const SiteLayoutLarge();
      }
    });
  }
}
