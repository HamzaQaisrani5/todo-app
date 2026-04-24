import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:app_bottom_bar/routing/route_names/route_names.dart';
import 'package:app_bottom_bar/utils/size_config.dart';

import '../../../../common_widget/asyn_value_ui.dart';
import '../controller/auth_controller.dart';
import '../widgets/common_text_field/common_text_field.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _State();
}

class _State extends ConsumerState<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _validateFields({required String email, required String password}) {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Not empty fields'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      ref
          .read(authControllerProvider.notifier)
          .signInUserWithEmailPassword(email: email, password: password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);
    ref.listen<AsyncValue>(authControllerProvider, (_, state) {
      state.showAlertDialogOnError(context);
    });

    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign In To Your Account 👋',
                style: TextStyle(fontSize: 18), //Appstyles.titleTextStyle,
              ),
              SizedBox(height: SizeConfig.getProportionateHeight(12)),
              CommonTextField(
                keyboardType: TextInputType.emailAddress,
                hintText: 'Email',
                hintStyle: TextStyle(fontSize: 12), //Appstyles.normalTextStyle,
                controller: emailController,
              ),
              SizedBox(height: SizeConfig.getProportionateHeight(11)),
              CommonTextField(
                keyboardType: TextInputType.text,
                hintText: 'Password',
                hintStyle: TextStyle(fontSize: 12), //Appstyles.normalTextStyle,
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(height: SizeConfig.getProportionateHeight(15)),
              TextButton(
                onPressed: () {
                  _validateFields(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                },
                style: state.isLoading
                    ? null
                    : TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        // foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        fixedSize: Size(SizeConfig.screenWidht, 40),
                      ),
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 12),
                  // Appstyles.normalTextStyle.copyWith(
                  //   color: Colors.white,
                  // ),
                ),
              ),
              SizedBox(height: SizeConfig.getProportionateHeight(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(fontSize: 12), //Appstyles.normalTextStyle,
                  ),
                  InkWell(
                    onTap: () {
                      context.pushReplacement(RouteNames.register);
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 12, //Appstyles.normalTextStyle.copyWith(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
