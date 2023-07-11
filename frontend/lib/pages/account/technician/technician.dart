import 'package:flutter/material.dart';

class TechnicianAccountPage extends StatelessWidget {
  const TechnicianAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 800),
      child: ListView(
        children: [
          Text('Technician Display Name',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
          const SizedBox(
            height: 36,
          ),
          Text('Tags',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              Chip(label: Text('Tag 1')),
              Chip(label: Text('Tag 2')),
              Chip(label: Text('Tag 3')),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text('Location',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
          const SizedBox(
            height: 10,
          ),
          Text('Westlands, Nairobi',
              style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(
            height: 10,
          ),
          Text('About',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
          const SizedBox(
            height: 10,
          ),
          Text(
              '''Mollit do et id officia quis exercitation Lorem. Commodo ad nisi non eu sunt non. Tempor amet ad duis ut cupidatat dolor cupidatat. Pariatur occaecat sint tempor tempor incididunt sunt. Cillum nisi tempor aliquip sint commodo nisi sit adipisicing dolor irure commodo ex esse. Laborum ex amet duis sint officia irure. Minim dolor enim est minim id aute Lorem occaecat fugiat esse do reprehenderit.Ipsum excepteur culpa adipisicing sit. Magna Lorem non laboris quis nostrud eiusmod. Ex sit ullamco id fugiat. Eu consequat et mollit cupidatat Lorem pariatur mollit labore ipsum.''',
              style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(
            height: 10,
          ),
          Text('Services Offered',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
          const SizedBox(
            height: 10,
          ),
          Text('Services Offered',
              style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.message),
                label: const Text('Message'),
                style: FilledButton.styleFrom(
                  fixedSize: const Size.fromHeight(40),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit_note_rounded),
                label: const Text('Edit Profile'),
                style: OutlinedButton.styleFrom(
                  fixedSize: const Size.fromHeight(40),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
