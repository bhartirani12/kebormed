import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kebormed/core/utils/app_utility.dart';
import '../../../core/utils/app_storage.dart';
import 'bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FocusNode userNameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isRemembered = false;
  final AppUtility appUtility;
  String token = '';
  final AppStorage appStorage;

  LoginBloc({required this.appStorage, required this.appUtility})
      : super(const EmptyState()) {
    on<LoginPageReadyEvent>((event, emit) async {
      emit(const LoadingState());
      loadUserCredentials();
      emit(const LoginPageReadyState(true));
    });
    on<UserLoginEvent>((event, emit) => emit(const LoadingState()));
    on<LoginFailureEvent>((event, emit) => emit(const LoginFailureState()));
    on<LoginSuccessEvent>((event, emit) => emit(const LoginSuccessState()));
    on<NoInternetEvent>((event, emit) => emit(NoInternetState()));
    on<UpdateRememberMeEvent>((event, emit) {
      isRemembered = event.isRemembered;
      emit(UpdateRememberMeState(isRemembered));
    });
    add(LoginPageReadyEvent());
  }

  @override
  Future<void> onEvent(LoginEvent event) async {
    super.onEvent(event);
    if (event is UserLoginEvent) {
      if (event.username.isNotEmpty && event.password.isNotEmpty) {
        saveUserCredentials(event.username, event.password);
        add(const LoginSuccessEvent());
      } else {
        add(const LoginFailureEvent());
      }
    }
  }

  void loadUserCredentials() {
    userNameController.text = appStorage.getUsername() ?? '';
    passwordController.text = appStorage.getPassword() ?? '';
    isRemembered = appStorage.getRememberMe() ?? false;
  }

  void saveUserCredentials(String username, String password) async {
    generateToken();
    if (isRemembered) {
      await appStorage.saveCredentials(username, password, isRemembered, token);
    } else {
      await appStorage.clearCredentials();
    }
  }

  void generateToken() {
    String secretKey = appUtility.generateRandomKey(32);
    String data = '${userNameController.text}|${passwordController.text}';
    token = appUtility.generateHMACToken(secretKey, data);
  }
}
