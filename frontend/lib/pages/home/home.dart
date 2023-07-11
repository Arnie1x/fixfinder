import 'package:fixfinder/pages/technician/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<TechnicianListController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TechnicianListController());
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trending Technicians',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
          const SizedBox(
            height: 30,
          ),
          controller.obx(
            (data) => GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisExtent: 170),
              children: data!
                  .map(
                    (e) => GridTile(
                        child: Card(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(e.name ?? ''),
                              subtitle: const Text('Rating'),
                              titleTextStyle: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer),
                              contentPadding: const EdgeInsets.all(0),
                            ),
                            Text(
                              e.description ?? 'No Description Yet',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant),
                            )
                          ],
                        ),
                      ),
                    )),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
