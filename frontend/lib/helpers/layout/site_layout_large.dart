import 'package:fixfinder/helpers/local_navigator.dart';
import 'package:flutter/material.dart';

class SiteLayoutLarge extends StatelessWidget {
  const SiteLayoutLarge({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Material(
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            'fixfinder',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      SearchBar(
                        elevation: const MaterialStatePropertyAll(2),
                        hintText: 'Search for a Technician',
                        hintStyle: MaterialStatePropertyAll(
                            Theme.of(context).textTheme.bodyLarge),
                        trailing: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.search_outlined))
                        ],
                      ),
                      Expanded(child: Container()),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.home_rounded),
                        iconSize: 42,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.account_circle_outlined),
                        iconSize: 42,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(100, 0, 10, 0),
                          child: Container(child: beamerNavigator()),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 100, 0),
                          child: Container(child: messagesBeamerNavigator()),
                        )),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
