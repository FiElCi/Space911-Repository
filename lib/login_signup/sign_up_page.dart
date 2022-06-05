import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetime_app/constant/colors.dart';
import 'package:meetime_app/constant/picture.dart';
import 'package:meetime_app/constant/text_style.dart';
import 'package:meetime_app/service/auth.dart';
import 'login_page.dart';
import 'package:meetime_app/homepageavatarpage/home_page.dart';
import 'package:meetime_app/home.dart';
//FİREBASE TANIMLAMA
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _usernameController = TextEditingController();

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(24),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    sizeBox25(),
                    _inputImage(context),
                    _inputField(context),
                    sizeBox25(),
                    _inputButton(context),
                    _inputTextLogin(context),
                    _inputGoogleLogin(context),
                    sizeBox25(),
                    _inputWithoutsignin(context),
                  ]),
            ),
          )),
    );
  }

  SizedBox sizeBox25() => const SizedBox(height: 25,);

  _inputImage(context) {
    return Image.asset(meetimeLogo, height: 200, width: 500);
  }

  _inputField(context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.mail,
            ),
            label: Text("E-mail", style: TextStyleMeetime.headline16subtitle),
            hintText: "E-mail",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
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
        const SizedBox(
          height: 20,
        ),
        TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person),
            label: Text("Username", style: TextStyleMeetime.headline16subtitle),
            hintText: "Username",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ],
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
          onPressed: () {},
          child: Text("Kayıt Ol", style: TextStyleMeetime.whitetext16,)),
    );
  }

  _inputTextLogin(context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("Yoksa üyemiz misin?", style: TextStyleMeetime.headlinegrey14),
      TextButton(
          onPressed: () { 
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return LoginPage();
              },
            ));
          },
          child: Text(
            "Giriş Yap",
            style: TextStyleMeetime.bluetext14,
          ))
    ]);
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

  _inputWithoutsignin(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {
              //Üye olmadan devam et kısmı, kodları yazıldı. Navigation sayfası yani home.dart dosyasına yönlendirildi.
              Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return HomeNavigatePage();
              },
            ));
            },
            child: Text("Üye Olmadan Devam Et",
                style: TextStyleMeetime.headlinegrey14)),
        Icon(
          Icons.arrow_right_outlined,
          color: Colors.black38,
        ),
      ],
    );
  }
}
