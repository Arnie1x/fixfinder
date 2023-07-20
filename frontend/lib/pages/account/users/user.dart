import 'package:beamer/beamer.dart';
import 'package:fixfinder/routes/routes.dart';
import 'package:fixfinder/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAccountPage extends StatelessWidget {
  const UserAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    StorageService storageService = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'User Account Page',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
        Text(
          'Username',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(
          storageService.box.read('username') ?? 'N/A',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(
          'Email',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(
          storageService.box.read('email') ?? 'N/A',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        // Text(
        //   'First Name',
        //   style: Theme.of(context)
        //       .textTheme
        //       .bodyMedium
        //       ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
        // ),
        // Text(
        //   storageService.box.read('first_name') ?? 'No First Name',
        //   style: Theme.of(context)
        //       .textTheme
        //       .headlineSmall
        //       ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
        // ),
        // Text(
        //   'Last Name',
        //   style: Theme.of(context)
        //       .textTheme
        //       .bodyMedium
        //       ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
        // ),
        // Text(
        //   storageService.box.read('last_name') ?? 'No Last Name',
        //   style: Theme.of(context)
        //       .textTheme
        //       .headlineSmall
        //       ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
        // ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            // FilledButton.icon(
            //   onPressed: () {
            //     NavigationController
            //         .instance.mainBeamerKey.currentState?.routerDelegate
            //         .beamToNamed(Routes.accountUpdateRoute);
            //   },
            //   icon: const Icon(Icons.edit_outlined),
            //   label: const Text('Change Account Information'),
            //   style: FilledButton.styleFrom(
            //     fixedSize: const Size.fromHeight(40),
            //   ),
            // ),
            // const SizedBox(
            //   width: 15,
            // ),
            // OutlinedButton.icon(
            //   onPressed: () {
            //     NavigationController
            //         .instance.mainBeamerKey.currentState?.routerDelegate
            //         .beamToNamed(Routes.passwordChangeRoute);
            //   },
            //   icon: const Icon(Icons.edit_outlined),
            //   label: const Text('Change Password'),
            //   style: FilledButton.styleFrom(
            //     fixedSize: const Size.fromHeight(40),
            //   ),
            // ),
            OutlinedButton.icon(
              onPressed: () {
                // NavigationController
                //     .instance.mainBeamerKey.currentState?.routerDelegate
                //     .beamToNamed('${Routes.technicianAccountRoute}/new');
                Beamer.of(context)
                    .beamToNamed('${Routes.technicianAccountRoute}/new');
              },
              icon: const Icon(Icons.edit_outlined),
              label: const Text('Create Technician Profile'),
              style: FilledButton.styleFrom(
                fixedSize: const Size.fromHeight(40),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
