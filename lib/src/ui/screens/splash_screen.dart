import 'package:catdogdec/src/core/utils/styles.dart';
import 'package:catdogdec/src/core/utils/ui_helper.dart';
import 'package:catdogdec/src/ui/screens/mycat_yourdog.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';



class MySplashScreen extends StatelessWidget {
  const MySplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(
        seconds: 2,
        navigateAfterSeconds: const HomeScreen(),
        backgroundColor: bkColor,
        image: Image.asset(splashImage),
        loaderColor: appColor,
        title: Text(
          "My Cat Vs Your Dog",
          style: kTextStyle.copyWith(
            color: Colors.white,
            fontSize: UIHelper.kLargeFont,
          ),
        ),
        photoSize: screenWidth(context) / 3,
        loadingText: Text(
          "Pls wait",
          style: kTextStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
