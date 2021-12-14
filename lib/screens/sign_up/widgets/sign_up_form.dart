import 'package:ecommerce_app/consts/constants.dart';
import 'package:ecommerce_app/screens/sign_in/widgets/form_error.dart';
import 'package:ecommerce_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:ecommerce_app/widgets/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String password = '';
  String confirmPassword = '';
  final _confPassController = TextEditingController();
  bool isObscurePassword = true;

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    Navigator.pushNamed(context, CompleteProfileScreen.routeName);
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: 20),
          buildPasswordFormField(),
          SizedBox(height: 20),
          buildConfirmPasswordFormField(),
          SizedBox(height: 10),
          FormError(errors: errors),
          SizedBox(height: 10),
          DefaultButton(
            title: 'Continue',
            onPressed: () {
              _submitForm();
              // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
            },
          )
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
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
      obscureText: isObscurePassword,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 24.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                isObscurePassword = !isObscurePassword;
              });
            },
            child: Icon(Icons.lock),
          ),
        ),
      ),
      validator: (value) {
        final pass = value ?? '';
        password = pass;
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
        password = pass;
        if (pass.isNotEmpty) {
          _removeError(error: kPassEmptyError);
        }
        if (pass.length > 6) {
          _removeError(error: kPassShortError);
        }
      },
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      controller: _confPassController,
      obscureText: isObscurePassword,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        hintText: 'Re-enter your password',
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 24.0),
          child: GestureDetector(
            child: Icon(Icons.lock),
            onTap: () {
              setState(() {
                isObscurePassword = !isObscurePassword;
              });
            },
          ),
        ),
      ),
      validator: (value) {
        final pass = value ?? '';
        if (pass != password) {
          _addError(error: kPassConfirmError);
          return '';
        }
      },
      onChanged: (pass) {
        password = pass;
        if (pass == password) {
          _removeError(error: kPassConfirmError);
        }
      },
    );
  }
}
