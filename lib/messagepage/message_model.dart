import 'package:meetime_app/constant/picture.dart';
import 'package:meetime_app/messagepage/user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;
  
  Message(
    this.sender,
     this.time,
     this.text,
     this.isLiked,
     this.unread,
    
  );
}

final User currentUser = User(0, 'Kullanıcı', iconfirstavatar);

//Kullanıcılar;

final User ahmet = User(1, 'Ahmet Mutlu', messageAvatar1 );
final User erdem = User(2, 'Erdem Çelik', messageAvatar3 );
final User anil = User(3, 'Anıl İstanbullu', messageAvatar4 );
final User deniz = User(4, 'Deniz Gizem Mutlu', messageAvatar2 );
final User derya = User(5, 'Derya Yaprak', messageAvatar5 );
final User asli = User(6, 'Aslı Mutlu', messageAvatar6 );
final User yaren = User(7, 'Yaren Çiçek', messageAvatar7 );

//Chat Listesi
List<Message> chats = [
  Message(ahmet, '14:30', 'Merhaba, nasılsın? Bende Flutter Öğreniyorum', true, true),
  Message(erdem, '13:30', 'Merhaba, nasılsın? Bende Flutter Öğreniyorum', true, false),
  Message(anil, '14:30', 'Merhaba, nasılsın? Bende Flutter Öğreniyorum', false, true),
  Message(deniz, '14:30', 'Merhaba, nasılsın? Bende Flutter Öğreniyorum', true, true),
  Message(derya, '14:30', 'Merhaba, nasılsın? Bende Flutter Öğreniyorum', true, false),
  Message(yaren, '14:30', 'Merhaba, nasılsın? Bende Flutter Öğreniyorum', false, true),
];


List<Message> messages = [
  Message(ahmet, '14.30',  'Nasılsın', true, true),
  Message(currentUser, '14.35',  'İyiyim sen, Nasılsın', true, true),
  Message(ahmet, '14.45',  'Sağol, Nasılsın', true, true),
  Message(currentUser, '14.55',  'İyiyim sen, Nasılsın', true, true),
  Message(ahmet, '15.00',  'İyiyim sen, Nasılsın', true, true),
  Message(currentUser, '15.05',  'İyiyim sen, Nasılsın', true, true),
  Message(ahmet, '15.10',  'İyiyim sen, Nasılsın', true, true),
];