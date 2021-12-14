import 'package:ecommerce_app/screens/sign_in/widgets/sign_in_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        leading: Padding(
          padding: EdgeInsets.only(left: 36.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 20),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: SignInBody(),
    );
  }
}
