import 'package:ecommerce_app/consts/constants.dart';
import 'package:ecommerce_app/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: TextStyle(
            fontSize: getProportionalScreenHeight(16),
          ),
        ),
        SizedBox(width: getProportionalScreenWidth(5)),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(SignUpScreen.routeName);
          },
          child: Text(
            'Sign Up',
            style: TextStyle(color: kPrimaryColor, fontSize: getProportionalScreenHeight(16)),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
