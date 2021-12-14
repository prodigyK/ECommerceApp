import 'package:ecommerce_app/consts/constants.dart';
import 'package:ecommerce_app/screens/complete_profile/widgets/complete_profile_form.dart';
import 'package:ecommerce_app/screens/sign_in/widgets/form_error.dart';
import 'package:ecommerce_app/widgets/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class CompleteProfileScreen extends StatelessWidget {
  static const String routeName = '/complete-profile';

  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: getProportionalScreenWidth(30)),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  'Complete Profile',
                  style: headingStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                const Text(
                  'Complete your details o§r continue /nwith social media',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                CompleteProfileForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                const Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
