import 'package:app_bottom_bar/annotation_way_of_project/features/authentication/presentation/widgets/common_text_field/common_text_field.dart';
import 'package:app_bottom_bar/src/routing/state_route_name.dart';
import 'package:app_bottom_bar/src/states/auth_states/signup_state.dart';
import 'package:app_bottom_bar/src/providers/auth_provider/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:app_bottom_bar/annotation_way_of_project/routing/route_names/route_names.dart';
import 'package:app_bottom_bar/annotation_way_of_project/utils/size_config.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _State();
}

class _State extends ConsumerState<SignupScreen> {
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
          .read(signUpProvider.notifier)
          .createUserWithEmailAndPassword(email: email, password: password);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final state = ref.watch(signUpProvider);
    ref.listen(signUpProvider, (_, state) {
      if (state is SignupError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      } else if (state is SignupSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.successMessage),
            backgroundColor: Colors.green,
          ),
        );
        // context.go(StateRouteNames.homeScreen);
      }
      // state.showAlertDialogOnError(context);
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
                onPressed: state is SignupLoading
                    // state.isLoading
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
                      context.pushReplacement(StateRouteNames.signInScreen);
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
