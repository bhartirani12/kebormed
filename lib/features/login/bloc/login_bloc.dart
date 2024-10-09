import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kebormed/core/utils/app_utility.dart';

import '../../../core/routes/route.dart';
import '../../../core/utils/app_storage.dart';
import '../../../injection/injection_conatiner.dart';
import 'bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FocusNode userNameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isRemembered = false;
  final AppUtility _appUtility = AppUtility();
  String token = '';

  LoginBloc() : super(const EmptyState()) {
    loadUserCredentials();
  }

  //  // Retrieve saved credentials
  void loadUserCredentials() async {
    String? savedUsername = AppStorage.getUsername();
    String? savedPassword = AppStorage.getPassword();
    bool? savedRememberMe = AppStorage.getRememberMe();
    if (savedUsername != null) {
      userNameController.text = savedUsername;
    }
    if (savedPassword != null) {
      passwordController.text = savedPassword;
    }
    if (savedRememberMe != null) {
      isRemembered = savedRememberMe;
    }
  }

  // Save user credentials
  void saveUserCredentials(BuildContext context) async {
    generateToken();
    if (isRemembered) {
      await AppStorage.saveCredentials(userNameController.text,
          passwordController.text, isRemembered, token);
    } else {
      await AppStorage.clearCredentials();
    }
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, di<Routes>().home);
    }
  }

  // Generate Token
  void generateToken() {
    String secretKey = _appUtility.generateRandomKey(32);
    String data = '${userNameController.text}|${passwordController.text}';
    token = _appUtility.generateHMACToken(secretKey, data);
  }
}
