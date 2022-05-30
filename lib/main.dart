//Firebase Başlatma Dosyası Eklenmiştir.
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetime_app/swap_screen_into.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() async {
  //Firebase döngüyle başlar.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primaryColor: Colors.white
      ),
      //GEÇİŞLERİN YAPILDIĞI SAYFAYA GİDİYOR
      home: SwapScreenInto(),
      
    );
  }
}
