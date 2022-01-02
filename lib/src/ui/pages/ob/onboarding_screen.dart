import 'package:a_eye/src/animations/animate_screen.dart';
import 'package:a_eye/src/core/cache/gen_cache.dart';
import 'package:a_eye/src/core/models/onboarding_model.dart';
import 'package:a_eye/src/core/utils/constants.dart';
import 'package:a_eye/src/core/utils/styles.dart';
import 'package:a_eye/src/ui/pages/home_sreen/home_screen.dart';
import 'package:a_eye/src/ui/pages/ob/widget/onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ripple/flutter_ripple.dart';

class OnboadingScreen extends StatefulWidget {
  OnboadingScreen({Key? key}) : super(key: key);
  @override
  _OnboadingScreenState createState() => _OnboadingScreenState();
}

class _OnboadingScreenState extends State<OnboadingScreen> {
  @override
  void initState() {
    Storage().putString("usedBefore", "user");
    Storage().putString("session", "used");
    super.initState();
  }

  PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;
  int numberOfPages = 3;
  late OnBoardingListClass ob;
  List<Widget> _buildIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < numberOfPages; i++) {
      list.add(i == currentPage ? indicator(true) : indicator(false));
    }
    return list;
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      padding: const EdgeInsets.all(4.0),
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(left: 6),
      height: screenAwareSize(30, context),
      width: isActive
          ? screenAwareSize(30, context)
          : screenAwareSize(30, context),
      decoration: BoxDecoration(
        border: Border.all(
            width: 2.0,
            color: isActive
                ? ColorsTexStyleStore.kTriviaYellow
                : ColorsTexStyleStore.kTriviaYellow.withOpacity(0.3)),
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: screenAwareSize(20, context),
        width: isActive
            ? screenAwareSize(20, context)
            : screenAwareSize(20, context),
        decoration: BoxDecoration(
          color: isActive
              ? ColorsTexStyleStore.kTriviaYellow
              : ColorsTexStyleStore.kTriviaYellow.withOpacity(0.3),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            backgroundImage(currentPage),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Hero(
                      tag: 'logo',
                      child: Image.asset(
                        ImageStore.appLogo,
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ),
                  previewWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 15, bottom: 15),
                          child: indicatorWidget()),
                      FlutterRipple(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: screenAwareSize(15, context),
                            vertical: screenAwareSize(50, context),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: MaterialButton(
                              elevation: 10.0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100.0),
                                ),
                              ),
                              color: const Color(0xFFFFB61D),
                              minWidth: screenAwareSize(50, context),
                              // minWidth: screenAwareSize(80, context),
                              // height: screenAwareSize(80, context),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  PreviewSlideRoute(
                                    preview: HomeScreen(),
                                    duration: 200,
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                    fontFamily: 'PB',
                                    fontSize: screenAwareSize(19, context),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        radius: 40,
                        rippleColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded firstPageNextButton() {
    return Expanded(
        child: Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 15.0,
          bottom: 8,
        ),
        child: RawMaterialButton(
          onPressed: () {
            _pageController.nextPage(
                duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Text(
              //   "Next",
              //   style: kOnBoardingButtonStyle,
              // ),
              SizedBox(
                width: 12,
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.black,
                size: 30,
              )
            ],
          ),
        ),
      ),
    ));
  }

  Expanded lastButton() {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: Colors.black.withOpacity(0.6)),
                  onPressed: () {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeInOut,
                    );
                  }),
              IconButton(
                  icon: Icon(Icons.check, color: Colors.green),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PreviewSlideRoute(
                            preview: HomeScreen(), duration: 200));
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Expanded previousButton() {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: Colors.black.withOpacity(0.6)),
                  onPressed: () {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeInOut,
                    );
                  }),
              nextButton,
            ],
          ),
        ),
      ),
    );
  }

  Padding indicatorWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildIndicator(),
      ),
    );
  }

  Expanded previewWidget() {
    return Expanded(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: PageView(
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            physics: ClampingScrollPhysics(),
            controller: _pageController,
            children: [
              OnBoardingWidget(
                index: 0,
              ),
              OnBoardingWidget(
                index: 1,
              ),
              OnBoardingWidget(
                index: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get nextButton {
    return RawMaterialButton(
      onPressed: () {
        _pageController.nextPage(
            duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 12,
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.black,
            size: 30,
          )
        ],
      ),
    );
  }

  homeNavigator() {
    return Navigator.pushReplacement(
        context, PreviewSlideRoute(preview: HomeScreen(), duration: 300));
  }

  Container backgroundImage(int index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
              OnBoardingListClass().onBoardingList[index].imgDescription),
        ),
      ),
    );
  }

  Container coloredBackground({double? width, Widget? child}) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: double.infinity,
      child: child,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _buildIndicator();
    // previewCyclcer();
  }
}
