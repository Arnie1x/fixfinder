import 'package:fixfinder/pages/auth/login/controller.dart';
import 'package:fixfinder/routes/routes.dart';
import 'package:fixfinder/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController());
    return Scaffold(
        body: Center(
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Color.lerp(Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.primary, 0.05),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              Text(
                'Login',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 20,
              ),
              InputField(
                label: 'Email',
                textEditingController: controller.emailController,
                validator: (value) => controller.validateEmail(value!),
              ),
              InputField(
                label: 'Password',
                textEditingController: controller.passwordController,
                validator: (value) => controller.validateText(value!),
                inputType: TextInputType.visiblePassword,
                obscureText: true,
              ),

              FilledButton(
                onPressed: () {
                  controller.submitForm(context);
                },
                style: FilledButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    fixedSize: const Size(500, 46),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                child: const Text(
                  'Login',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Routes.routerDelegate
                        .beamToReplacementNamed('/auth/register');
                  },
                  child: Text(
                    'Are you a new user?',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
