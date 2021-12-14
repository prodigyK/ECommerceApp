import 'package:ecommerce_app/consts/constants.dart';
import 'package:ecommerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String? text;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const Text(
          'YAKOMOTO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36,
            color: kPrimaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          text ?? '',
        ),
        const Spacer(flex: 2),
        Image.asset(
          image!,
          width: SizeConfig.screenWidth * 0.7,
          height: SizeConfig.screenWidth * 0.7,
        ),
      ],
    );
  }
}
