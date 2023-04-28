import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/common/common.dart';
import 'package:twitter/common/loading_page.dart';
import 'package:twitter/constants/constants.dart';
import 'package:twitter/features/auth/controller/auth_controller.dart';
import 'package:twitter/features/auth/view/login_view.dart';
import 'package:twitter/features/auth/widgets/auth_feild.dart';
import 'package:twitter/theme/palette.dart';

class SignUpView extends ConsumerStatefulWidget {
  static route()=>  MaterialPageRoute(
    builder:(context)=>SignUpView(),
  );
  const SignUpView({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final appbar=UIConstants.appBar();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  void onSignUp(){
ref.read(authControllerProvider.notifier).signUp(
    email: emailController.text,
    password: passwordController.text,
    context: context);
}
  @override
  Widget build(BuildContext context) {
    final isLoading=ref.watch(authControllerProvider);
    return Scaffold(
      appBar: appbar,
      body: isLoading?const Loader()
          : Center(
        child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                AuthFeild(controller:emailController,hintText: 'email',),
                const SizedBox(height: 20,),
                AuthFeild(controller: passwordController,hintText: 'password',),
                const SizedBox(height: 5,),
                Align(alignment:Alignment.topRight,
                  child: RoundedButton(onTap: onSignUp, label: 'Done',),
                ),
                const SizedBox(height: 40,),
                RichText(text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: ' Login',
                      style: const TextStyle(
                        color: Pallete.blueColor,
                        fontSize: 16,
                      ),
                      recognizer: TapGestureRecognizer()..onTap=(){
                        Navigator.push(context,
                          LoginView.route(),
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
