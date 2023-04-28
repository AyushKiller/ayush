import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/apis/auth_api.dart';
import 'package:twitter/core/utils.dart';
import 'package:appwrite/models.dart'as model;
import 'package:twitter/features/auth/view/login_view.dart';
import 'package:twitter/features/home/view/home.view.dart';


final authControllerProvider = StateNotifierProvider<AuthController,bool >((ref) {
  return AuthController(authAPI: ref.watch(authAPTProvider)
  );
});

final currentUserAccountProvider = FutureProvider((ref) async {
  final authController=ref.watch(authControllerProvider.notifier);
  return authController.currentUser();
});

class AuthController extends StateNotifier<bool>{
  final AuthAPI _authAPI;
  AuthController({required AuthAPI authAPI}):_authAPI=authAPI,
        super (false);
  Future<model.User?>currentUser()=>_authAPI.currentUserAccount();

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
})async{
   state=true;
   final res= await _authAPI.signUp(email: email,
       password: password);
   state=false;
   res.fold(
           (l) => showSnackBar(context, l.message),
           (r) => {
             showSnackBar(context,'Account Created please login.'),
             Navigator.push(context, LoginView.route()),
   },
   );
  }
  void login({
  required String email,
  required String password,
  required BuildContext context,
})async{

    state=true;
    final res = await _authAPI.login
      (email:email, password: password);
    state=false;
    res.fold((l) => showSnackBar(context, l.message),
            (r) => {
      showSnackBar(context,'00'),
      Navigator.push(context, HomeView.route())
    }
    );
  }
}