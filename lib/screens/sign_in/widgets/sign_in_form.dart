
import 'package:ecommerce_app/consts/constants.dart';
import 'package:ecommerce_app/screens/sign_in/login_success.dart';
import 'package:ecommerce_app/widgets/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../forgot_password_screen.dart';
import 'form_error.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  final List<String> errors = [];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: 30),
          buildPasswordFormField(),
          SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                value: _rememberMe,
                onChanged: (value) {
                  _rememberMe = value ?? false;
                  setState(() {});
                },
              ),
              Text('Remember me'),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                },
                child: const Text(
                  'Forgot password',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.05),
          DefaultButton(
            title: 'Continue',
            onPressed: () {
              _submitForm();
              // Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    Navigator.pushNamed(context, LoginSuccess.routeName);
  }

  void _addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void _removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 24.0),
          child: Icon(Icons.email),
        ),
      ),
      validator: (value) {
        final email = value ?? '';
        if (email.isEmpty) {
          _addError(error: kEmailEmptyError);
          return '';
        } else if (!emailValidatorRegExp.hasMatch(email)) {
          _addError(error: kInvalidEmailError);
          return '';
        }
        return null;
      },
      onChanged: (email) {
        if (email.isNotEmpty) {
          _removeError(error: kEmailEmptyError);
        }
        if (emailValidatorRegExp.hasMatch(email)) {
          _removeError(error: kInvalidEmailError);
        }
      },
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 24.0),
          child: Icon(Icons.lock),
        ),
      ),
      validator: (value) {
        final pass = value ?? '';
        if (pass.isEmpty) {
          _addError(error: kPassEmptyError);
          return '';
        } else if (pass.length <= 6) {
          _addError(error: kPassShortError);
          return '';
        }
        return null;
      },
      onChanged: (pass) {
        if (pass.isNotEmpty) {
          _removeError(error: kPassEmptyError);
        }
        if (pass.length > 6) {
          _removeError(error: kPassShortError);
        }
      },
    );
  }
}
