import 'package:ecommerce_app/consts/constants.dart';
import 'package:ecommerce_app/screens/otp/otp_screen.dart';
import 'package:ecommerce_app/screens/sign_in/widgets/form_error.dart';
import 'package:ecommerce_app/widgets/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final List<String> errors = [];
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
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
          buildFirstNameField(),
          SizedBox(height: SizeConfig.screenHeight * 0.03),
          buildLastNameField(),
          SizedBox(height: SizeConfig.screenHeight * 0.03),
          buildPhoneNumberField(),
          SizedBox(height: SizeConfig.screenHeight * 0.03),
          buildAddressField(),
          errors.isNotEmpty ? FormError(errors: errors) : SizedBox(height: SizeConfig.screenHeight * 0.06),
          DefaultButton(
            title: 'Continue',
            onPressed: () {
              _submitForm();
              Navigator.pushNamed(context, OtpScreen.routeName);
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        labelText: 'Address',
        hintText: 'Enter your Address',
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 24.0),
          child: Icon(Icons.map),
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        hintText: 'Enter your phone number',
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 24.0),
          child: Icon(Icons.phone),
        ),
      ),
      validator: (value) {
        final phoneNumber = value ?? '';
        if (phoneNumber.isEmpty) {
          _addError(error: kPhoneEmptyError);
          return '';
        }
        return null;
      },
      onChanged: (phoneNumber) {
        if (phoneNumber.isNotEmpty) {
          _removeError(error: kPhoneEmptyError);
        }
      },
    );
  }

  TextFormField buildLastNameField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        labelText: 'Last Name',
        hintText: 'Enter your last name',
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 24.0),
          child: Icon(Icons.account_circle),
        ),
      ),
      validator: (value) {
        final lastName = value ?? '';
        if (lastName.isEmpty) {
          _addError(error: kLastNameEmptyError);
          return '';
        }
        return null;
      },
      onChanged: (lastName) {
        if (lastName.isNotEmpty) {
          _removeError(error: kLastNameEmptyError);
        }
      },
    );
  }

  TextFormField buildFirstNameField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        labelText: 'First Name',
        hintText: 'Enter your first name',
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 24.0),
          child: Icon(Icons.account_circle),
        ),
      ),
      validator: (value) {
        final firstName = value ?? '';
        if (firstName.isEmpty) {
          _addError(error: kFirstNameEmptyError);
          return '';
        }
        return null;
      },
      onChanged: (firstName) {
        if (firstName.isNotEmpty) {
          _removeError(error: kFirstNameEmptyError);
        }
      },
    );
  }
}
