import 'package:flutter/material.dart';
import 'package:meetime_app/constant/colors.dart';
import 'package:meetime_app/constant/picture.dart';
import 'package:meetime_app/constant/text_style.dart';
import 'package:meetime_app/homepageavatarpage/home_page_avatar.dart';
import 'package:meetime_app/homepageavatarpage/home_page_avatar_button.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HomePageAvatar> avatarbuttons = [
    HomePageAvatar("Kodlama", 'assets/icondeveloper.jpg'),
    HomePageAvatar("Dans", 'assets/icondancer.jpg'),
    HomePageAvatar("Fotoğraf", 'assets/iconphotographer.jpg'),
    HomePageAvatar("Müzik", 'assets/iconmusic.jpg'),
    HomePageAvatar("Resim", 'assets/iconpainting.jpg')
  ];

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return
        //HomePage Sayfası
        SafeArea(
            child: Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(children: [
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(iconfirstavatar),
                radius: 33,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hoş Geldin", style: TextStyleMeetime.blacktext16),
                Text("Bugün nasılsın?", style: TextStyleMeetime.black38text16),
              ],
            )
          ],
        ),
        Container(
          width: double.infinity,
          height: 150.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              //Scroll Butonların yazıldığı alan
              HomePageAvatarButton(avatarbuttons[0], context),
              HomePageAvatarButton(avatarbuttons[1], context),
              HomePageAvatarButton(avatarbuttons[2], context),
              HomePageAvatarButton(avatarbuttons[3], context),
              HomePageAvatarButton(avatarbuttons[4], context),
            ],
          ),
        ),  
        isVisible == true 
            ? VisibleWidget(isVisible: isVisible)
            : Center(
                child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Text(
                  "Seninle tanışmak güzel, aramıza Hoş Geldin, Lütfen yukarıdaki seçeneklerden ilgi alanını seçerek, bizimle paylaşır mısın? Yeni dostlukların için şimdiden çok heyecanlıyız. İyi Eğlenceler.",
                  style: TextStyleMeetime.black38text20,
                ),
              )),
      ]),
    ));
  }


//HomePageAvatarButton bölümüdür, aslında ayrı bir sayfa olarak başta açmıştım fakat state yönetiminde eksikliklerim olduğu için bu alana yeniden yazdım. Çünkü bu alanda set State yapıldığında görünür olma ve olmama durumlarının değişmesi sağlandı.
  Widget HomePageAvatarButton(HomePageAvatar avatar, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        InkWell(
          borderRadius: BorderRadius.circular(50.0),
            onTap: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          child: Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(color: Colors.black26, width: 1.0)),
            child: Padding(
                padding: EdgeInsets.all(3.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      image: DecorationImage(
                        image: AssetImage(avatar.avatarname),
                        fit: BoxFit.cover,
                      )),
                )),
          ),
        ),
        const SizedBox(height: 6.0),
        Text(avatar.userName),
      ]),
    );
  }
}


//Tıklandığında açılan pencerenin ana kodlarının yazıldığı yerdir, aşağıdaki ui kısmı ise sadece continer şekillendirilmesinin olduğu bölümdür.
class VisibleWidget extends StatelessWidget {
  const VisibleWidget({
    Key? key,
    required this.isVisible,
  }) : super(key: key);

  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        child: GridView.count(
          padding: EdgeInsets.only(left: 50, right: 50),
          mainAxisSpacing: 50 ,
          crossAxisSpacing: 20,
          crossAxisCount: 1,
          scrollDirection: Axis.horizontal,
          children: const [
            InterestView(subjectInterest: 'Uygulama Geliştirme',
             buttonsIntrest1: 'Flutter',
             buttonsIntrest2: 'Kotlin',
             buttonsIntrest3: 'Swift',
             ),
            InterestView(subjectInterest: 'Back-end Developer',
            buttonsIntrest1: 'Python',
            buttonsIntrest2: 'C#',
            buttonsIntrest3: 'Java'
            ),
            InterestView(subjectInterest: 'Front-end Developer',
            buttonsIntrest1: 'Html',
            buttonsIntrest2: 'Css',
            buttonsIntrest3: 'JavaScript',
            ),
          ]
        ),
      ),
    );
  }
}


//Uygulama Geliştirme, Backend ve Frontend kısımlarınındaki görüntülerin yani gri containerin düzenlenmesinden başlayarak ilerleyen ui kısmıdır.
class InterestView extends StatelessWidget {
  const InterestView({
    Key? key, required this.subjectInterest, required this.buttonsIntrest1, required this.buttonsIntrest2, required this.buttonsIntrest3,
  }) : super(key: key);

  final String subjectInterest; 
  final String buttonsIntrest1;
  final String buttonsIntrest2;
  final String buttonsIntrest3;
  @override
  Widget build(BuildContext context) {
    return Container(
    height: 307,
    width: 270,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(
          colors: [
            ColorsPalette.greyPalette200,
            ColorsPalette.whitePalette,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [BoxShadow(
          color: ColorsPalette.greyPalette200,
          blurRadius: 2.0, offset: Offset(2, 2))]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      
        Center(
          child: Text(
           subjectInterest,
            style: TextStyleMeetime.black38text20,
          ),
        ),
         ElevationButtonHome(userInterest: buttonsIntrest1,),
         ElevationButtonHome(userInterest: buttonsIntrest2,),
         ElevationButtonHome(userInterest: buttonsIntrest3),
      ],
    ),
        );
  }
}


//Uygulama Geliştirme, backend ve frontend kısımlarının içindeki butonların kodlarıdır.
class ElevationButtonHome extends StatelessWidget {
  const ElevationButtonHome({
    Key? key, required this.userInterest,
  }) : super(key: key);
 final String userInterest;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 155,
        height: 37,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: ColorsPalette.greyOpacityPalette50,
            boxShadow: [
              BoxShadow(
                color: ColorsPalette.greyPalette200,
                blurRadius: 2.0, offset: const Offset(2, 2))
            ]),
        child: ElevatedButton(
           style: ElevatedButton.styleFrom(
             primary: ColorsPalette.greyOpacityPalette50,
           ),
            onPressed: () {
              
            },
            child: Text(userInterest,
                style: TextStyleMeetime.black38text16)));
  }
}
