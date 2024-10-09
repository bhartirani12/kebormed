import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../injection/injection_conatiner.dart';
import '../../../resources/resource.dart';
import '../bloc/bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  late FormValidator formValidator;

  @override
  void initState() {
    _loginBloc = di<LoginBloc>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    formValidator = FormValidator(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginBloc,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: ProgressLoader(
              inAsyncCall: false,
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: MarginKeys.bodyCommonVerticalMargin,
                        right: MarginKeys.bodyCommonVerticalMargin,
                        bottom: MarginKeys.bodyCommonVerticalMargin,
                        top: MarginKeys.bodyCommonTopMargin),
                    child: _buildLoginForm(
                      context: context,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoginForm({
    required final BuildContext context,
  }) {
    return Form(
      key: _loginBloc.formKey,
      child: Padding(
        padding: const EdgeInsets.all(
          MarginKeys.commonContainerPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTitleWidget(
                context: context,
                title: translate(context, StringKeys.login) ?? '',
                themeColor: Theme.of(context).colorScheme.onPrimaryFixed),
            const SizedBox(
              height: MarginKeys.commonContainerPadding,
            ),
            _buildEmailWidget(
              context: context,
            ),
            const SizedBox(
              height: MarginKeys.inputFieldVerticalMargin,
            ),
            _buildPasswordWidget(
              context: context,
            ),
            const SizedBox(
              height: MarginKeys.inputFieldVerticalMargin,
            ),
            _buildRememberMeWidget(context: context),
            CommonButton(
              key: WidgetKeys.loginButton,
              onPressed: _loginButtonPressed,
              label: translate(
                    context,
                    StringKeys.login,
                  ) ??
                  '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailWidget({
    required final BuildContext context,
  }) {
    return AppTextFieldWidget(
      key: WidgetKeys.loginUsername,
      inputPlaceHolder: translate(
            context,
            StringKeys.email,
          ) ??
          '',
      controller: _loginBloc.userNameController,
      focusNode: _loginBloc.userNameFocus,
      inputType: TextInputType.emailAddress,
      validator: (value) {
        return formValidator.validateEmail(
          value,
        );
      },
      textInputAction: TextInputAction.done,
      whitelistingTextInputFormatter:
          FilteringTextInputFormatter.allow(RegExp('[^\\s]')),
    );
  }

  Widget _buildTitleWidget({
    required final BuildContext context,
    required final String title,
    required final Color themeColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
          top: MarginKeys.dialogBoxContentMargin * 0.8,
          left: MarginKeys.dialogBoxContentMargin * 0.8),
      child: Text(
        title,
        style: TextStyles.listItemLableStyle
            .copyWith(color: themeColor, fontSize: 25),
      ),
    );
  }

  Widget _buildPasswordWidget({
    required final BuildContext context,
  }) {
    return AppTextFieldWidget(
      key: WidgetKeys.loginPassword,
      inputPlaceHolder: translate(
            context,
            StringKeys.password,
          ) ??
          '',
      isPassword: true,
      hidden: true,
      controller: _loginBloc.passwordController,
      focusNode: _loginBloc.passwordFocus,
      inputType: TextInputType.text,
      validator: (value) {
        return formValidator.validatePassword(
          value,
        );
      },
      textInputAction: TextInputAction.done,
      whitelistingTextInputFormatter:
          FilteringTextInputFormatter.allow(RegExp('[^\\s]')),
    );
  }

  Widget _buildRememberMeWidget({
    required final BuildContext context,
  }) {
    return Transform.translate(
        offset: const Offset(-10, 0),
        child: Row(children: [
          Checkbox(
              value: _loginBloc.isRemembered,
              onChanged: (bool? value) {
                setState(() {
                  _loginBloc.isRemembered = value ?? false;
                });
              },
              checkColor: Colors.white, // color of tick Mark
              activeColor: Theme.of(context).colorScheme.primary),
          Transform.translate(
            offset: const Offset(-7, 0),
            child: Text(
              translate(
                    context,
                    StringKeys.rememberMe,
                  ) ??
                  '',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryFixed,
                    fontSize: 16,
                  ),
            ),
          ),
        ]));
  }

  Future<void> _loginButtonPressed() async {
    _loginBloc.userNameFocus.unfocus();
    _loginBloc.passwordFocus.unfocus();
    if (_loginBloc.formKey.currentState?.validate() ?? false) {
      _loginBloc.saveUserCredentials(context);
      ;
    }
  }
}
