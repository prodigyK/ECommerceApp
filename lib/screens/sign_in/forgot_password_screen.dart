import 'package:ecommerce_app/consts/constants.dart';
import 'package:ecommerce_app/screens/sign_in/widgets/form_error.dart';
import 'package:ecommerce_app/screens/sign_in/widgets/no_account_text.dart';
import 'package:ecommerce_app/widgets/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = '/forgot-password';

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        width: double.infinity,
        // height: SizeConfig.screenHeight,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: getProportionalScreenWidth(28),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                const Text(
                  'Please enter your email and we will send \nyou a link to return to your account',
                  textAlign: TextAlign.center,
                ),
                // SizedBox(height: 30),
                // Spacer(flex: 2),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                ForgotForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotForm extends StatefulWidget {
  const ForgotForm({Key? key}) : super(key: key);

  @override
  _ForgotFormState createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {
  final List<String> errors = [];
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          FormError(errors: errors),
          // SizedBox(height: 30),
          DefaultButton(
            title: 'Continue',
            onPressed: () {
              _submitForm();
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText(),
        ],
      ),
    );
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
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
}
