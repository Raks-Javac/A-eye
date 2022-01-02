import 'package:a_eye/src/animations/animate_screen.dart';
import 'package:a_eye/src/core/utils/constants.dart';
import 'package:a_eye/src/core/utils/styles.dart';
import 'package:a_eye/src/ui/pages/ob/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _popOffStackSplashScreen();
  }

  Future _popOffStackSplashScreen() {
    return Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          PreviewSlideRoute(preview: OnboadingScreen(), duration: 650));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(
          ImageStore.appLogo,
          width: screenAwareSize(400, context),
          height: screenAwareSize(400, context),
        ),
      ),
      bottomNavigationBar: Container(
        height: screenAwareSize(150, context),
        child: Column(
          children: [
            Text(
              "A-eye",
              style: TextStyle(
                fontFamily: "PR",
                letterSpacing: 3.0,
              ),
            ),
            UIHelper.verticalSpaceSmall,
            Text(
              "An artificial intelligent toolbox app just for you",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "PR",
                fontSize: screenAwareSize(16, context),
                letterSpacing: 1.2,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
