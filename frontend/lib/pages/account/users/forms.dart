import 'package:beamer/beamer.dart';
import 'package:fixfinder/pages/account/users/controllers.dart';
import 'package:fixfinder/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordChangePage extends GetView<PasswordChangeController> {
  const PasswordChangePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.delete<PasswordChangeController>();
    Get.put(PasswordChangeController());
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Change Password',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
          const SizedBox(
            height: 36,
          ),
          InputField(
            label: 'New Password',
            textEditingController: controller.password1Controller,
            validator: (value) => controller.validateText(value!),
            obscureText: true,
          ),
          InputField(
            label: 'Confirm New Password',
            textEditingController: controller.password2Controller,
            validator: (value) => controller.validateText(value!),
            obscureText: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  FilledButton.icon(
                    onPressed: () {
                      controller.submitForm();
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
            ],
          )
        ],
      ),
    );
  }
}

class AccountUpdatePage extends GetView<UserAccountController> {
  const AccountUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.delete<UserAccountController>();
    Get.put(UserAccountController());
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Change Account Information',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
          const SizedBox(
            height: 36,
          ),
          InputField(
            label: 'Username',
            textEditingController: controller.usernameController,
            validator: (value) => controller.validateText(value!),
          ),
          InputField(
            label: 'First Name',
            textEditingController: controller.firstNameController,
            validator: (value) => controller.validateText(value!),
          ),
          InputField(
            label: 'Last Name',
            textEditingController: controller.lastNameController,
            validator: (value) => controller.validateText(value!),
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
            ],
          )
        ],
      ),
    );
  }
}
