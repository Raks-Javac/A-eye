// ignore: must_be_immutable
import 'package:a_eye/src/core/models/onboarding_model.dart';
import 'package:a_eye/src/core/utils/constants.dart';
import 'package:a_eye/src/core/utils/styles.dart';
import 'package:flutter/material.dart';

class OnBoardingWidget extends StatelessWidget {
  OnBoardingListClass onBoardingList = OnBoardingListClass();
  int index;
  OnBoardingWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 30),
                width: MediaQuery.of(context).size.width / 1.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("${onBoardingList.onBoardingList[index].title}",
                        textAlign: TextAlign.center,
                        style: kTextStyle.copyWith(
                          color: ColorsTexStyleStore.kTriviaYellow,
                          fontSize: screenAwareSize(25, context),
                          fontFamily: "PB",
                          fontWeight: FontWeight.bold,
                        )),
                    UIHelper.verticalSpaceSmall,
                    Text(
                        "${onBoardingList.onBoardingList[index].descriptionText}",
                        textAlign: TextAlign.center,
                        style: kTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: UIHelper.kMediumFont,
                          fontWeight: FontWeight.w100,
                        )),
                    UIHelper.verticalSpaceSmall,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
