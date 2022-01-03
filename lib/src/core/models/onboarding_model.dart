class OnBoarding {
  String imgDescription;
  String descriptionText;
  String title;
  OnBoarding(
      {required this.imgDescription,
      required this.descriptionText,
      required this.title});
}

class OnBoardingListClass {
  String returnbk(int index) {
    return "assets/images/onboarding${index + 1}.png";
  }

  List<OnBoarding> onBoardingList = [
    OnBoarding(
      imgDescription: "assets/images/onboarding1.png",
      title: "Reality Check",
      descriptionText:
          "With the A-eye app you can identify objects in one click",
    ),
    OnBoarding(
      imgDescription: "assets/images/onboarding2.png",
      title: "Reality Check",
      descriptionText:
          "With the A-eye app you can identify objects in one click",
    ),
    OnBoarding(
      imgDescription: "assets/images/onboarding3.png",
      title: "Reality Check",
      descriptionText:
          "With the A-eye app you can identify objects in one click",
    ),
  ];
}
