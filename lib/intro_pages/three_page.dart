import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meetime_app/constant/picture.dart';
import 'package:meetime_app/constant/text_style.dart';

class ThreePage extends StatelessWidget {
  const ThreePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [
        Container(
            child: SvgPicture.asset(greenPicture), width: 360, height: 460),
            Text('City illustrations by Storyset', 
        style: TextStyleMeetime.black38text14,
        textAlign: TextAlign.end,
        ),
        Text(
          "Gerçek Hayatta Buluş",
          style: TextStyleMeetime.headline24light,
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
