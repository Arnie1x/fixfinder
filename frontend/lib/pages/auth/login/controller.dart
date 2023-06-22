import 'package:fixfinder/pages/auth/login/provider.dart';
import 'package:fixfinder/routes/routes.dart';
import 'package:fixfinder/services/storage_service.dart';
import 'package:fixfinder/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  String? validateText(String value) {
    if (value.isEmpty) {
      return "Field cannot be empty";
    }
    return null;
  }

  void submitForm(BuildContext context) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    formKey.currentState!.save();
    var loading = CustomToast.loadingIndicator();
    Map user = {
      'email': emailController.text,
      'password': passwordController.text
    };

    StorageService storageService = Get.find();

    final response = await LoginProvider().postData(user);
    if (!response.status.hasError) {
      CustomToast.toast('Welcome');
      await storageService.box.write('access', response.body['access']);
      await storageService.box.write('refresh', response.body['refresh']);
      await storageService.box
          .write('username', response.body['user']['username']);
      await storageService.box.write('email', response.body['user']['email']);
      Routes.routerDelegate.beamToReplacementNamed('/');
    } else {
      CustomToast.toast('Error ${response.status.code}: Try Again',
          isError: true);
    }
    loading();
  }
}
