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
  final AppUtility appUtility;
  String token = '';
  final AppStorage appStorage;

  LoginBloc({required this.appStorage, required this.appUtility})
      : super(const EmptyState()) {
    loadUserCredentials();
  }

  //  // Retrieve saved credentials
  void loadUserCredentials() async {
    await appStorage.initializePrefs();
    String? savedUsername = appStorage.getUsername();
    String? savedPassword = appStorage.getPassword();
    bool? savedRememberMe = appStorage.getRememberMe();
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
      await appStorage.saveCredentials(userNameController.text,
          passwordController.text, isRemembered, token);
    } else {
      await appStorage.clearCredentials();
    }
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, di<Routes>().home);
    }
  }

  // Generate Token
  void generateToken() {
    String secretKey = appUtility.generateRandomKey(32);
    String data = '${userNameController.text}|${passwordController.text}';
    token = appUtility.generateHMACToken(secretKey, data);
  }
}
