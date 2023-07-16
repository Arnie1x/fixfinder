import 'package:fixfinder/api/api.dart';
import 'package:fixfinder/controllers/navigation_controller.dart';
import 'package:fixfinder/pages/account/users/providers.dart';
import 'package:fixfinder/routes/routes.dart';
import 'package:fixfinder/services/storage_service.dart';
import 'package:fixfinder/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordChangeController extends GetxController {
  PasswordChangeController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController password1Controller, password2Controller;

  @override
  void onInit() async {
    super.onInit();
    password1Controller = TextEditingController();
    password2Controller = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    disposeControllers();
  }

  void disposeControllers() {
    password1Controller.dispose();
    password2Controller.dispose();
  }

  String? validateText(String value) {
    if (value.isEmpty) {
      return "Please Enter a Password";
    }
    if (password1Controller.text != password2Controller.text) {
      return "Passwords Must Match";
    }
    return null;
  }

  void submitForm() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    formKey.currentState!.save();
    var loading = CustomToast.loadingIndicator();
    Map<String, String> map = {
      "new_password1": password1Controller.text,
      "new_password2": password2Controller.text,
    };

    final response = await DjangoAPI().postData(PasswordProvider().route, map);
    if (!response.status.hasError) {
      CustomToast.toast('Password Updated Successfully');
      NavigationController.instance.mainBeamerKey.currentState?.routerDelegate
          .beamToReplacementNamed(Routes.accountRoute);
    } else {
      CustomToast.toast('Error ${response.status.code}: Try Again',
          isError: true);
    }
    loading();
  }
}

class UserAccountController extends GetxController {
  UserAccountController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController usernameController,
      firstNameController,
      lastNameController;

  StorageService storageService = Get.find();

  @override
  void onInit() async {
    super.onInit();
    usernameController =
        TextEditingController(text: storageService.box.read('username') ?? '');
    firstNameController = TextEditingController(
        text: storageService.box.read('first_name') ?? '');
    lastNameController =
        TextEditingController(text: storageService.box.read('last_name') ?? '');
  }

  @override
  void onClose() {
    super.onClose();
    disposeControllers();
  }

  void disposeControllers() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
  }

  String? validateText(String value) {
    if (value.isEmpty) {
      return "Please Enter Some Text";
    }
    return null;
  }

  void submitForm() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    formKey.currentState!.save();
    var loading = CustomToast.loadingIndicator();
    Map<String, String> map = {
      "username": usernameController.text,
      "first_name": firstNameController.text,
      "last_name": lastNameController.text,
    };

    final response = await DjangoAPI().postData(PasswordProvider().route, map);
    if (!response.status.hasError) {
      CustomToast.toast('Account Updated Successfully');
    } else {
      CustomToast.toast('Error ${response.status.code}: Try Again',
          isError: true);
    }
    loading();
  }
}
