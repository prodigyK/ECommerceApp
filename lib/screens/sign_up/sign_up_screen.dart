import 'package:ecommerce_app/consts/constants.dart';
import 'package:ecommerce_app/screens/sign_in/widgets/social_card.dart';
import 'package:ecommerce_app/screens/sign_up/widgets/sign_up_form.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/sign-up';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: getProportionalScreenWidth(30)),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                'Register Account',
                style: headingStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              const Text(
                'Sign in with your email and password \n or continue with social media',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
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
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(
                'By continuing your confirm that you agree with /nour Term and Condition',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
