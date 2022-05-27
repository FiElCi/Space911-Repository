import 'package:flutter/material.dart';
import 'package:meetime_app/constant/colors.dart';
import 'package:meetime_app/constant/picture.dart';
import 'package:meetime_app/constant/text_style.dart';

//Profilim
class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                    meetimeLogo,
                    height: 100,
                    width: 40,
                  ),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 130,
                        width: 130,
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                              color: ColorsPalette.greyOpacityPalette50,
                              blurRadius: 3.0,
                              offset: const Offset(2, 2))
                        ]),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(iconfirstavatar),
                        ))
                  ],
                ),
                const SizedBox(height: 35),
                const AccountFormField(
                  labelTextValue: 'Ad-Soyad',
                  hintTextValue: 'Ad-Soyad',
                ),
                const AccountFormField(
                  labelTextValue: 'Kullanıcı Adı',
                  hintTextValue: 'Kullanıcı Adı',
                ),
                const AccountFormField(
                  labelTextValue: 'Şehir',
                  hintTextValue: 'Şehir',
                ),
                const AccountFormField(
                  labelTextValue: 'İlgi Alnı',
                  hintTextValue: 'İlgi Alanı',
                ),
                const AccountFormField(
                  labelTextValue: 'Hakkımda',
                  hintTextValue: 'Hakkımda',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ColorsPalette.pinkOpacityPalette80,
                        ),
                        onPressed: () {},
                        child: Container(
                            height: 36,
                            width: 79,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                              'Kaydet',
                              style: TextStyleMeetime.whitetext16,
                            ))))
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class AccountFormField extends StatelessWidget {
  const AccountFormField({
    Key? key,
    required this.labelTextValue,
    required this.hintTextValue,
  }) : super(key: key);

  final String labelTextValue;
  final String hintTextValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 12.0),
      child: TextFormField(
          cursorColor: ColorsPalette.buttongreyPalette100,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
            labelText: labelTextValue,
            hintText: hintTextValue,
            labelStyle: TextStyleMeetime.black38text16,
            hintStyle: TextStyleMeetime.black38text16,
            filled: true,
            fillColor: ColorsPalette.greyOpacityPalette50,
            focusColor: ColorsPalette.whitePalette,
          )),
    );
  }
}
