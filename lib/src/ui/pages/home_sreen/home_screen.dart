import 'package:a_eye/src/core/utils/constants.dart';
import 'package:a_eye/src/core/utils/styles.dart';
import 'package:a_eye/src/ui/pages/appBar_folder/app_bar.dart';
import 'package:a_eye/src/ui/pages/home_sreen/widget/text_fiield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AeyeAppBar(),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good morning",
                    style: kTextStyle,
                  ),
                  UIHelper.verticalSpaceSmall,
                  Text(
                    "Highlighted below is a variety of features you can plug into all a click away. Happy A-eye",
                    style: kTextStyle.copyWith(
                      fontSize: screenAwareSize(15.5, context),
                      fontFamily: "PL",
                    ),
                  ),
                  UIHelper.verticalSpaceMedium,
                  TextFieldWidgetBlack(
                    hintText: "Search A-eye.....",
                    prefix: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.search,
                          color: ColorsTexStyleStore.kTriviaYellow),
                    ),
                    hintTextStyle: kTextStyle.copyWith(
                      fontSize: screenAwareSize(15.5, context),
                      fontFamily: "PL",
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: AnimationLimiter(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(
                      4,
                      (int index) {
                        return Container(
                          height: 500,
                          child: AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            columnCount: 2,
                            child: ScaleAnimation(
                              child: FadeInAnimation(
                                child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  color: ColorsTexStyleStore.kTriviaLightYellow,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
