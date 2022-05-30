import 'package:flutter/material.dart';
import 'package:meetime_app/constant/picture.dart';
import 'package:meetime_app/home.dart';
import 'package:meetime_app/service/auth.dart';
import '../constant/colors.dart';
import '../constant/text_style.dart';

//Değişkenler tanımlandı.
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

//AuthService Değişkeni eklendi
AuthService _authService = AuthService();

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 75),
            _inputImage(context),
            _inputField(context),
            _inputTextButton(context),
            _inputButton(context),
            _inputGoogleLogin(context),
          ],
        ),
      )),
    ));
  }

  _inputImage(context) {
    return Image.asset(meetimeLogo, height: 250, width: 500);
  }

  _inputField(context) {
    return Column(children: [
      TextField(
        controller: _emailController,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.mail,
          ),
          label: Text("E-mail-Username",
              style: TextStyleMeetime.headline16subtitle),
          hintText: "E-mail-Username",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      TextField(
        controller: _passwordController,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.check),
          label: Text("Password", style: TextStyleMeetime.headline16subtitle),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        obscureText: true,
      ),
    ]);
  }

  _inputTextButton(context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: () {},
          child: Text("Şifremi Unuttum", style: TextStyleMeetime.blacktext14)),
    );
  }

  _inputButton(context) {
    return Container(
      color: ColorsPalette.pinkOpacityPalette80,
      height: 39,
      width: 129,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: ColorsPalette.pinkOpacityPalette80,
          ),
          onPressed: () {
            //Firebase Giriş İşlemleri
            _authService.signIn(
                _emailController.text, _passwordController.text);
            // Bitiş
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return HomeNavigatePage();
              },
            ));
          },
          child: Text(
            "Giriş Yap",
            style: TextStyleMeetime.whitetext16,
          )),
    );
  }

  _inputGoogleLogin(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          iconPictureGoogle,
          height: 24,
          width: 24,
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              "Google ile Giriş Yap",
              style: TextStyleMeetime.headline16subtitle,
            ))
      ],
    );
  }
}