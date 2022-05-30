
import 'package:flutter/material.dart';
import 'package:meetime_app/homepageavatarpage/home_page_avatar.dart';
//AvatarButton Tasarımı
Widget HomePageAvatarButton(HomePageAvatar avatar, BuildContext context) {
  
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(50.0),
          onTap: (){
            
          },
          child: Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(color: Colors.black26, width: 1.0)
            ),
            child: Padding(
             padding: EdgeInsets.all(3.0),
             child: Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(50.0),
               image: DecorationImage(
                 image: AssetImage(avatar.avatarname),
                 fit: BoxFit.cover,
                )
             ) ,
             )
            ),
          ),
        ),
        const SizedBox(height: 6.0),
        Text(avatar.userName),
      ]
    ),
  );
}

