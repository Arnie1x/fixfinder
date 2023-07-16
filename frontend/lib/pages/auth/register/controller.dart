import 'package:fixfinder/controllers/navigation_controller.dart';
import 'package:fixfinder/pages/auth/register/provider.dart';
import 'package:fixfinder/routes/routes.dart';
import 'package:fixfinder/services/storage_service.dart';
import 'package:fixfinder/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RegisterController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController usernameController,
      emailController,
      passwordController,
      confirmPasswordController;

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  String? validateText(String value) {
    if (value.isEmpty) {
      return "Field cannot be empty";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }

  String? validatePasswordMatching(String value) {
    if (value != passwordController.text) {
      return "Password does not match";
    }
    return validateText(value);
  }

  void submitForm() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    formKey.currentState!.save();
    var loading = CustomToast.loadingIndicator();
    Map user = {
      'username': usernameController.text,
      'email': emailController.text,
      'password1': passwordController.text,
      'password2': confirmPasswordController.text,
    };
    StorageService storageService = Get.find();
    final response = await RegisterProvider().postData(user);
    if (!response.hasError) {
      CustomToast.toast('Registered Successfully');
      await storageService.box.write('access', response.body['access']);
      await storageService.box.write('refresh', response.body['refresh']);
      await storageService.box.write('id', response.body['user']['pk']);
      await storageService.box
          .write('username', response.body['user']['username']);
      await storageService.box.write('email', response.body['user']['email']);
      await storageService.box
          .write('first_name', response.body['user']['first_name']);
      await storageService.box
          .write('last_name', response.body['user']['last_name']);
      // ignore: use_build_context_synchronously
      // Beamer.of(context).beamToReplacementNamed(Routes.homeRoute);
      NavigationController.instance.mainBeamerKey.currentState?.routerDelegate
          .beamToReplacementNamed(Routes.homeRoute);
      // beam to Confirmation Email Page
    } else {
      CustomToast.toast('Error ${response.status.code}: ${response.body}',
          isError: true);
    }
    loading();
  }
}
