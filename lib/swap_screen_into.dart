import 'package:flutter/material.dart';
import 'package:meetime_app/constant/colors.dart';
import 'package:meetime_app/constant/text_style.dart';
import 'package:meetime_app/intro_pages/first_page.dart';
import 'package:meetime_app/intro_pages/four_page.dart';
import 'package:meetime_app/intro_pages/three_page.dart';
import 'package:meetime_app/intro_pages/two_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login_signup/sign_up_page.dart';

class SwapScreenInto extends StatefulWidget {
 const SwapScreenInto({Key? key}) : super(key: key);

  @override
  State<SwapScreenInto> createState() => _SwapScreenIntoState();
}

class _SwapScreenIntoState extends State<SwapScreenInto> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 3);
                });
              },
              children: const [
                //İNTRO_PAGES DE TÜM SAYFALARIN KODLARI BULUNUYOR 
                FirstPage(),
                TwoPage(),
                ThreePage(),
                FourPage(),
              ]),
          Container(
              alignment: const Alignment(0.9, 0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        _controller.jumpToPage(4);
                      },
                      child: Text(
                        "skip",
                        style: TextStyleMeetime.blacktext14,
                      )),
                  SmoothPageIndicator(
                      effect: SwapEffect(
                        activeDotColor: ColorsPalette.pinkOpacityPalette80,
                        dotColor: ColorsPalette.pinkOpacityPalette10,
                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                      controller: _controller,
                      count: 4),
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) {
                             return SignUpPage();
                           },));
                          },
                          child: Text(
                            "Done",
                            style: TextStyleMeetime.blacktext14,
                          ))
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration:const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: Text(
                            "Next",
                            style: TextStyleMeetime.blacktext14,
                          ))
                ],
              ))
        ],
      ),
    );
  }
}
