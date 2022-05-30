import 'package:flutter/material.dart';
import 'package:meetime_app/constant/picture.dart';
//Search ekranındaki kişilerin kodları burada, adı, resimavatar,id, şehri, ilgi alanı
class MatchUiModel{
  String MatchUserName;
  String MatchUserAvatar;
  int MatchUserid;
  String MatchUserCity;
  String MatchUserInterest;
   
  MatchUiModel(this.MatchUserName, this.MatchUserAvatar, this.MatchUserid, this.MatchUserCity, this.MatchUserInterest);

}


//Ui tasarımı için yapılan liste

List<MatchUiModel> MatchUiList = [
 MatchUiModel('Ahmet Mutlu', messageAvatar1, 0, 'İzmir', 'Flutter Developer'),
 MatchUiModel('Erdem Çelik', messageAvatar3, 1, 'İzmir', 'Flutter öğreniyor'),
 MatchUiModel('Anıl İstanbullu', messageAvatar4, 2, 'İzmir', 'Flutter Developer'),
 MatchUiModel('Deniz Gizem Mutlu', messageAvatar2, 3, 'İzmir', 'Flutter öğreniyor'),
 MatchUiModel('Derya Yaprak', messageAvatar5, 4, 'İzmir', 'Flutter Developer'),
 MatchUiModel('Yaren Çiçek', messageAvatar7, 5, 'İzmir', 'Flutter öğreniyor'),
];