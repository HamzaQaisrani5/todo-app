import 'package:app_bottom_bar/annotation_way_of_project/features/authentication/presentation/widgets/common_text_field/common_text_field.dart';
import 'package:app_bottom_bar/annotation_way_of_project/utils/size_config.dart';
import 'package:app_bottom_bar/src/providers/auth_provider/login_provider.dart';
import 'package:app_bottom_bar/src/routing/state_route_name.dart';
import 'package:app_bottom_bar/src/states/auth_states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _State();
}

class _State extends ConsumerState<LoginScreen> {
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
          .read(logInProvider.notifier)
          .signInWithEmailAndPassword(email: email, password: password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(logInProvider);
    ref.listen<LoginState>(logInProvider, (_, next) {
      if (next is LoginError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      } else if (next is LoginSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.successMessage),
            backgroundColor: Colors.green,
          ),
        );
        context.go(StateRouteNames.bottomscreen);
      }
    });

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
                onPressed: state is LoginLoading
                    ? null
                    : () {
                        _validateFields(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                      },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  fixedSize: Size(SizeConfig.screenWidht, 40),
                ),
                child: Text('Sign In', style: TextStyle(fontSize: 12)),
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
                      context.pushReplacement(StateRouteNames.signupScreen);
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
