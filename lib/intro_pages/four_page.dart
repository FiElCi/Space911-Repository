import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meetime_app/constant/picture.dart';
import 'package:meetime_app/constant/text_style.dart';

class FourPage extends StatelessWidget {
  const FourPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [
        Container(
            child: SvgPicture.asset(orangePicture), width: 460, height: 460),
         Text('People illustrations by Storyset', 
        style: TextStyleMeetime.black38text14,
        textAlign: TextAlign.end,
        ),   
        Text(
          "Arkadaşlıkların gerçek olsun",
          style: TextStyleMeetime.headline24light,
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
