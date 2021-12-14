
import 'package:ecommerce_app/consts/constants.dart';
import 'package:ecommerce_app/widgets/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _formKey = GlobalKey<FormState>();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  void nextField({required String value, required FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionalScreenWidth(60),
                // height: getProportionalScreenHeight(60),
                child: TextFormField(
                  decoration: otpInputDecoration,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                  autofocus: true,
                  onChanged: (value) {
                    nextField(value: value, focusNode: focusNode2);
                  },
                ),
              ),
              SizedBox(
                width: getProportionalScreenWidth(60),
                // height: getProportionalScreenHeight(60),
                child: TextFormField(
                  focusNode: focusNode2,
                  decoration: otpInputDecoration,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                  autofocus: true,
                  onChanged: (value) {
                    nextField(value: value, focusNode: focusNode3);
                  },
                ),
              ),
              SizedBox(
                width: getProportionalScreenWidth(60),
                // height: getProportionalScreenHeight(60),
                child: TextFormField(
                  focusNode: focusNode3,
                  decoration: otpInputDecoration,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                  autofocus: true,
                  onChanged: (value) {
                    nextField(value: value, focusNode: focusNode4);
                  },
                ),
              ),
              SizedBox(
                width: getProportionalScreenWidth(60),
                // height: getProportionalScreenHeight(60),
                child: TextFormField(
                  focusNode: focusNode4,
                  decoration: otpInputDecoration,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                  autofocus: true,
                  onChanged: (value) {
                    if (value.length == 1) {
                      focusNode4.unfocus();
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            title: 'Continue',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
