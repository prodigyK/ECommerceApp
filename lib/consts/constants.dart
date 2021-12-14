import 'dart:ui';

import 'package:flutter/material.dart';

import '../size_config.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kDefaultPadding = 20;

final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const kEmailEmptyError = 'Please enter your email';
const kInvalidEmailError = "Please Enter Valid Email";
const kPassEmptyError = 'Please Enter your password';
const kPassShortError = 'Password is too short';
const kPassMatchError = "Passwords don't match";
const kPassConfirmError = "Passwords are not equal";
const kFirstNameEmptyError = "Enter you first name";
const kLastNameEmptyError = "Enter you last name";
const kPhoneEmptyError = "Enter your phone number";

TextStyle headingStyle = TextStyle(
  fontSize: getProportionalScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
