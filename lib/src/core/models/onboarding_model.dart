class OnBoarding {
  String imgDescription;
  String descriptionText;
  String title;
  OnBoarding({required this.imgDescription, required this.descriptionText, required this.title});
}

class OnBoardingListClass {
  String returnbk(int index) {
    return "assets/images/onboarding${index + 1}.png";
  }

  List<OnBoarding> onBoardingList = [
    OnBoarding(
      imgDescription: "assets/images/onboarding1.png",
      title: " Purchase your Airtime, Data and Utility with Hisa",
      descriptionText: "Easy purchase of all these a click away.",
    ),
    OnBoarding(
      imgDescription: "assets/images/onboarding2.png",
      title: 'Own a business',
      descriptionText: "Become a reseller and a business owner today",
    ),
    OnBoarding(
      imgDescription: "assets/images/onboarding3.png",
      title: "Topup your Device",
      descriptionText:
          "Convenient and secure checkout with the widest range of payment options.",
    ),
  ];
}
