import 'package:ecommerce_app/consts/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50, //SizeConfig.screenHeight * 0.06,
      width: SizeConfig.screenWidth * 0.85,
      child: TextButton(
        child: Text(title, style: TextStyle(fontSize: 18)),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          backgroundColor: kPrimaryColor,
          primary: Colors.white,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
