import 'package:ecommerce_app/consts/constants.dart';
import 'package:ecommerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:ecommerce_app/widgets/default_button.dart';
import 'package:ecommerce_app/screens/splash/splash_content.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;

  List<Map<String, String>> contentData = [
    {
      'text': 'Welcome to Tokio. Let\'s shop!',
      'image': 'assets/images/splash_1.png',
    },
    {
      "text": "We help people conect with store \naround United State of America",
      "image": "assets/images/splash_2.png",
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: contentData.length,
                itemBuilder: (context, index) {
                  return SplashContent(
                    text: contentData[index]['text'],
                    image: contentData[index]['image'],
                  );
                },
                onPageChanged: (page) {
                  setState(() {
                    currentPage = page;
                  });
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(contentData.length, (index) => buildDot(index: index)),
                  ),
                  Spacer(flex: 3),
                  DefaultButton(
                    title: 'Continue',
                    onPressed: () {
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    },
                  ),
                  Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: currentPage == index ? 16 : 10,
      height: 10,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
      ),
    );
  }
}


