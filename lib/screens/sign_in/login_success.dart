import 'package:ecommerce_app/size_config.dart';
import 'package:ecommerce_app/widgets/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginSuccess extends StatelessWidget {
  static const String routeName = '/login-success';

  const LoginSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Success'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Spacer(flex: 1),
            Image.asset('assets/images/success.png'),
            Spacer(flex: 1),
            Text(
              'Login Success',
              style: TextStyle(
                fontSize: getProportionalScreenWidth(28),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Container(
              width: SizeConfig.screenWidth * 0.6,
              child: DefaultButton(
                title: 'Back to home',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
