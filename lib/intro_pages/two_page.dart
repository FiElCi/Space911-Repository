import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meetime_app/constant/picture.dart';
import 'package:meetime_app/constant/text_style.dart';

class TwoPage extends StatelessWidget {
  const TwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [
        Container(
            child: SvgPicture.asset(pinkPicture), width: 360, height: 360),
        Text('Online illustrations by Storyset', 
        style: TextStyleMeetime.black38text14,
        textAlign: TextAlign.end,
        ),
        Text(
          "Ortak İlgi Alanına Sahip Kişilerle Tanış",
          style: TextStyleMeetime.headline24light,
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
