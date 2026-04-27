import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:app_bottom_bar/annotation_way_of_project/common_widget/asyn_value_ui.dart';
import 'package:app_bottom_bar/annotation_way_of_project/features/authentication/presentation/controller/auth_controller.dart';
import 'package:app_bottom_bar/annotation_way_of_project/routing/route_names/route_names.dart';
import 'package:app_bottom_bar/annotation_way_of_project/utils/size_config.dart';

import '../widgets/common_text_field/common_text_field.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _State();
}

class _State extends ConsumerState<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _validate({required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Fields not be empty'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ref
          .read(authControllerProvider.notifier)
          .createuserWithEmailAndPassword(email: email, password: password);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final state = ref.watch(authControllerProvider);
    ref.listen(authControllerProvider, (_, state) {
      state.showAlertDialogOnError(context);
    });
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Register Your Account 👋', style: TextStyle(fontSize: 18)),
              SizedBox(height: SizeConfig.getProportionateHeight(12)),
              CommonTextField(
                keyboardType: TextInputType.emailAddress,
                hintText: 'Email',
                hintStyle: TextStyle(fontSize: 12),
                controller: emailController,
              ),
              SizedBox(height: SizeConfig.getProportionateHeight(11)),
              CommonTextField(
                keyboardType: TextInputType.text,
                hintText: 'Password',
                hintStyle: TextStyle(fontSize: 12),
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(height: SizeConfig.getProportionateHeight(15)),
              TextButton(
                onPressed: state.isLoading
                    ? null
                    : () {
                        _validate(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                      },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  // foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  fixedSize: Size(SizeConfig.screenWidht, 40),
                ),
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 12).copyWith(color: Colors.white),
                ),
              ),
              SizedBox(height: SizeConfig.getProportionateHeight(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Have an Account?', style: TextStyle(fontSize: 12)),
                  InkWell(
                    onTap: () {
                      context.pushReplacement(RouteNames.signIn);
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 12,
                      ).copyWith(color: Colors.green),
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
