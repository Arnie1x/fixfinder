import 'package:beamer/beamer.dart';
import 'package:fixfinder/pages/technician/controller.dart';
import 'package:fixfinder/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TechnicianAccountPage extends GetView<TechnicianController> {
  late String id;
  late String route;
  TechnicianAccountPage({super.key, required this.id, required this.route});

  @override
  Widget build(BuildContext context) {
    Get.delete<TechnicianController>();
    Get.put(TechnicianController(id: int.parse(id)));
    StorageService storageService = Get.find();
    return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: controller.obx(
          (data) => ListView(
            children: [
              Text(data?.name ?? 'Name Unknown',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary)),
              const SizedBox(
                height: 36,
              ),
              // Text('Tags',
              //     style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              //         color: Theme.of(context).colorScheme.secondary)),
              // const SizedBox(
              //   height: 10,
              // ),
              // const Row(
              //   children: [
              //     Chip(label: Text('Tag 1')),
              //     Chip(label: Text('Tag 2')),
              //     Chip(label: Text('Tag 3')),
              //   ],
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              Text('Location',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.secondary)),
              const SizedBox(
                height: 10,
              ),
              Text(data?.location ?? 'Location Unknown',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(
                height: 10,
              ),
              Text('About',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.secondary)),
              const SizedBox(
                height: 10,
              ),
              Text(data?.description ?? 'No Description',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(
                height: 10,
              ),
              Text('Services Offered',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.secondary)),
              const SizedBox(
                height: 10,
              ),
              Text(data?.services ?? 'Services Offered',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  if (storageService.box.read('technician') == null)
                    FilledButton.icon(
                      onPressed: () {
                        controller.openChat(
                            user1: storageService.box.read('id') ?? -1,
                            user2: int.parse(id));
                      },
                      icon: const Icon(Icons.message),
                      label: const Text('Message'),
                      style: FilledButton.styleFrom(
                        fixedSize: const Size.fromHeight(40),
                      ),
                    ),
                  const SizedBox(
                    width: 15,
                  ),
                  if (storageService.box.read('technician') != null)
                    OutlinedButton.icon(
                      onPressed: () {
                        Beamer.of(context).beamToNamed(
                          '$route/edit',
                        );
                      },
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
        ));
  }
}
