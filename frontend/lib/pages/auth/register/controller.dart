import 'package:fixfinder/pages/auth/register/provider.dart';
import 'package:fixfinder/routes/routes.dart';
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
      'email': usernameController.text,
      'password1': passwordController.text,
      'password2': confirmPasswordController.text,
    };

    final response = await RegisterProvider().postData(user);
    if (response.statusCode == 200 || response.statusCode == 204) {
      CustomToast.toast('Record Created');
      // beam to Confirmation Email Page
      Routes.routerDelegate.beamToReplacementNamed('/auth');
    } else {
      CustomToast.toast(
          'Error ${response.status.code}: ${response.body['non_field_errors']}',
          isError: true);
    }
    loading();
  }
}
