import 'package:flutter/material.dart';
import 'package:meetime_app/constant/colors.dart';
import 'package:meetime_app/constant/text_style.dart';
import 'package:meetime_app/models/match_ui_model.dart';
import '../constant/picture.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    meetimeLogo,
                    height: 100,
                    width: 40,
                  ),
                ],
              ),
               Container(
                 padding: const EdgeInsets.only(
                   left: 25, right: 25
                 ),
                 child: Center(
                   child: Text("Seninle Benzer İlgi Alanlarına Sahip Kişileri Bulmaya Hazır Mısın?", style: TextStyleMeetime.blacktext20, textAlign: TextAlign.center,),),
               ),
              const SizedBox(height: 10),
              Center(child: Text("Hadi Başlayalım", style: TextStyleMeetime.blacktext20)),
              const SizedBox(height: 10,),
              Container(
                height: MediaQuery.of(context).size.height * 0.60,
                child: ListView.builder(
                  padding: const EdgeInsets.all(50),
                  itemCount: MatchUiList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return   
                   Center(
                    child: Container(
                      height: 370,
                      width: 265,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: ColorsPalette.greyOpacityPalette50,
                              offset: const Offset(4, 4),
                            )
                          ],
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              colors: [
                                ColorsPalette.greyPalette200,
                                ColorsPalette.whitePalette
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                   Container(
                                    height: 88,
                                    width: 88,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(MatchUiList[index].MatchUserAvatar),),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                   Text(MatchUiList[index].MatchUserName, style: TextStyleMeetime.headline24,)
                                  ],),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                   Text(MatchUiList[index].MatchUserCity, style: TextStyleMeetime.blacktext20,)
                                  ],),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                   Text(MatchUiList[index].MatchUserInterest, style: TextStyleMeetime.blacktext20,)
                                  ],),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          boxShadow:  [
                                            BoxShadow(
                                              color: ColorsPalette.greyPalette300,
                                              blurRadius: 1.0,
                                              offset: const Offset(2, 2)
                                            )
                                          ],
                                          gradient: LinearGradient(
                                            colors: [
                                            ColorsPalette.greyOpacityPalette50,
                                            ColorsPalette.whitePalette],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(onPressed: (){}, icon:  Icon(Icons.delete , color: ColorsPalette.pinkOpacityPalette80,))),
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          boxShadow:  [
                                            BoxShadow(
                                              color: ColorsPalette.greyPalette300,
                                              blurRadius: 1.0,
                                              offset: const Offset(2, 2)
                                            )
                                          ],
                                          gradient: LinearGradient(
                                            colors: [
                                            ColorsPalette.greyOpacityPalette50,
                                            ColorsPalette.whitePalette],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(onPressed: (){}, icon:  Icon(Icons.favorite , color: ColorsPalette.pinkOpacityPalette80,)))
                                    ],
                                  ),
                                  const SizedBox(height: 10,)
                                ],
                              ),
                    ),
                   );
                 }
                ),
              ),
            ],
          )),
    );
  }
}
