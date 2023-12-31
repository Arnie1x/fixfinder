import 'package:fixfinder/controllers/navigation_controller.dart';
import 'package:fixfinder/controllers/users.dart';
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

  void submitForm() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    formKey.currentState!.save();
    var loading = CustomToast.loadingIndicator();
    Map user = {
      'email': emailController.text,
      'password': passwordController.text,
    };

    StorageService storageService = Get.find();

    final response = await LoginProvider().postData(user);
    // final technician = await DjangoAPI().getData('api/technicians/user/');
    if (!response.hasError) {
      CustomToast.toast('Welcome');
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
      await storageService.box.write(
          'technician',
          UserController.instance.techniciansList
              .firstWhereOrNull(
                (element) => response.body['user']['pk'] == element.user,
              )!
              .id);

      Routes.routerDelegate.beamToReplacementNamed('/');
      // ignore: use_build_context_synchronously
      NavigationController.instance.mainBeamerKey.currentState?.routerDelegate
          .beamToReplacementNamed(Routes.homeRoute);
    } else {
      CustomToast.toast('Error ${response.status.code}: ${response.body}',
          isError: true);
    }
    loading();
  }
}
