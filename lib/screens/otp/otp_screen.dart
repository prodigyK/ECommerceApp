import 'package:ecommerce_app/consts/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

import '../../size_config.dart';
import 'otp_form.dart';

class OtpScreen extends StatelessWidget {
  static const String routeName = '/otp-screen';

/*final  final String phoneNumber;

  OtpScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  'OTP Verification',
                  style: headingStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                const Text(
                  'We sent you code to +1 8050 495 ***',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                TweenAnimationBuilder(
                  tween: IntTween(begin: 31, end: 0),
                  duration: const Duration(seconds: 31),
                  builder: (context, int value, _) {
                    return RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          const TextSpan(text: 'This code will expire in '),
                          TextSpan(
                            text: sprintf('0:%.2i', [value]),
                            style: const TextStyle(color: kPrimaryColor),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.15),
                OtpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.15),
                GestureDetector(
                  onTap: () {
                    // Resend code
                  },
                  child: const Text(
                    'Resend OTP Code',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
