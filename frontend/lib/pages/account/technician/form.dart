import 'package:beamer/beamer.dart';
import 'package:fixfinder/pages/account/technician/controller.dart';
import 'package:fixfinder/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TechnicianFormPage extends GetView<TechnicianFormController> {
  late int id;
  TechnicianFormPage({super.key, this.id = -1});

  @override
  Widget build(BuildContext context) {
    Get.put(TechnicianFormController(id: id));
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Edit Technician Profile',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
          const SizedBox(
            height: 36,
          ),
          InputField(
            label: 'Technician Display Name',
            textEditingController: controller.displayNameController,
            validator: (value) => controller.validateText(value!),
          ),
          InputField(
            label: 'Location',
            textEditingController: controller.locationController,
            validator: (value) => controller.validateText(value!),
          ),
          InputField(
            label: 'About',
            textEditingController: controller.aboutController,
            validator: (value) => controller.validateText(value!),
            maxLines: 5,
          ),
          InputField(
            label: 'Services Offered',
            textEditingController: controller.servicesOfferedController,
            validator: (value) => controller.validateText(value!),
            maxLines: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  FilledButton.icon(
                    onPressed: () {
                      controller.submitForm();
                      Beamer.of(context)
                          .beamBack(replaceRouteInformation: true);
                    },
                    icon: const Icon(Icons.edit_outlined),
                    label: const Text('Confirm'),
                    style: FilledButton.styleFrom(
                      fixedSize: const Size.fromHeight(40),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      Beamer.of(context).beamBack();
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text('Discard'),
                    style: OutlinedButton.styleFrom(
                      fixedSize: const Size.fromHeight(40),
                      foregroundColor: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
              IconButton.outlined(
                  onPressed: () {
                    Beamer.of(context).beamBack();
                  },
                  tooltip: 'Delete Profile',
                  icon: const Icon(Icons.delete_forever),
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.error,
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.error,
                          width: 1.2),
                      fixedSize: const Size.fromHeight(40)))
            ],
          )
        ],
      ),
    );
  }
}
