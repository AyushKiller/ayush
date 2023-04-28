import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/common/common.dart';
import 'package:twitter/common/loading_page.dart';
import 'package:twitter/constants/constants.dart';
import 'package:twitter/features/auth/controller/auth_controller.dart';
import 'package:twitter/features/auth/view/signup_view.dart';
import 'package:twitter/features/auth/widgets/auth_feild.dart';
import 'package:twitter/theme/palette.dart';



class LoginView extends ConsumerStatefulWidget {
  static route()=>  MaterialPageRoute(
    builder:(context)=>LoginView(),
  );
  const LoginView({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  void onlogin() {
    ref.read(authControllerProvider.notifier).login(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }
    @override
    Widget build(BuildContext context) {
      final isLoading = ref.watch(authControllerProvider.notifier).state;
      return Scaffold(
        appBar: appbar,
        body: isLoading ? const Loader()
            : Center(
          child: SingleChildScrollView(
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  AuthFeild(controller: emailController, hintText: 'email',),
                  const SizedBox(height: 20,),
                  AuthFeild(
                    controller: passwordController, hintText: 'password',),
                  const SizedBox(height: 5,),
                  Align(alignment: Alignment.topRight,
                    child: RoundedButton(onTap: onlogin, label: 'Done',),
                  ),
                  const SizedBox(height: 40,),
                  RichText(text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: ' Sign up',
                        style: const TextStyle(
                          color: Pallete.blueColor,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context,
                              SignUpView.route(),
                            );
                          },
                      ),
                    ],
                  ),),

                ],
              ),
            ),
          ),
        ),
      );
    }
  }
