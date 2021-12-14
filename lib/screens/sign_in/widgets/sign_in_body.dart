import 'package:ecommerce_app/screens/sign_in/widgets/sign_in_form.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:ecommerce_app/screens/sign_in/widgets/social_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'no_account_text.dart';

class SignInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Spacer(),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              const Text(
                'Sign in with your email and password \n or continue with social media',
                textAlign: TextAlign.center,
              ),
              // SizedBox(height: 30),
              // Spacer(flex: 2),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              SignForm(),
              // Spacer(flex: 2),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: "assets/icons/google-icon.svg",
                    onPressed: () {},
                  ),
                  SocialCard(
                    icon: "assets/icons/facebook-2.svg",
                    onPressed: () {},
                  ),
                  SocialCard(
                    icon: "assets/icons/twitter.svg",
                    onPressed: () {},
                  ),
                ],
              ),
              // Spacer(flex: 3),
              // SizedBox(height: SizeConfig.screenHeight * 0.08),
              SizedBox(height: getProportionalScreenHeight(20)),
              NoAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
