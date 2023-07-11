import 'dart:math';

import 'package:flutter/material.dart';

class ChatHomePage extends StatelessWidget {
  const ChatHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Chats',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
        const SizedBox(
          height: 20,
        ),
        const Text('No Chats Yet'),
        Card(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              child: const Align(
                heightFactor: 5,
                child: Text(
                  'A',
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.2,
                ),
              ),
            ),
            title: const Text('Header'),
            subtitle: const Text('Subhead'),
            visualDensity: VisualDensity.comfortable,
            enableFeedback: true,
          ),
        )
      ],
    );
  }
}
