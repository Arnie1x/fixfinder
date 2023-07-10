import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
          GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisExtent: 170),
            children: [
              GridTile(
                  child: Card(
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Technician Name'),
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
                        'Lorem ipsum dolor sit amet consectetur. At imperdiet in vitae turpis lectus. Purus pulvinar et risus egestas maecenas sed. Curabitur a eget varius ornare tellus. Purus pulvinar et risus egestas maecenas sed. Curabitur a eget varius ornare tellus. Purus pulvinar et risus egestas maecenas sed. Curabitur a eget varius ornare tellus.',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant),
                      )
                    ],
                  ),
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
