import 'package:a_eye/src/core/utils/constants.dart';
import 'package:a_eye/src/core/utils/styles.dart';
import 'package:a_eye/src/ui/pages/appBar_folder/app_bar.dart';
import 'package:a_eye/src/ui/pages/home_sreen/widget/text_fiield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Tile(
                        index: index, extent: screenAwareSize(310, context));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  double? setBoxHeight(int index) {
    switch (index) {
      case 1:
        return (index % 5) * 160;
      case 2:
        return (index % 5) * 70;
      case 3:
        return (index % 5) * 70;
      case 4:
        return (index % 5) * 70;
      default:
        return (index % 5) * 70;
    }
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      margin: EdgeInsets.only(
        bottom: 10,
        right: 5,
      ),
      decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).primaryColor,
          image: DecorationImage(
            image: AssetImage("assets/images/onboarding1.png"),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            width: 1.5,
            color: ColorsTexStyleStore.kTriviaYellow,
          ),
          borderRadius: BorderRadius.circular(
            8,
          )),
      height: extent,
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}
