import 'package:flutter/material.dart';
import 'package:meetime_app/constant/colors.dart';
import 'package:meetime_app/constant/picture.dart';
import 'package:meetime_app/constant/text_style.dart';
import 'package:meetime_app/messagepage/message_model.dart';
import 'package:meetime_app/messagepage/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  const ChatScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          flexibleSpace: const FlexibleSpaceBar(expandedTitleScale: 6.0,),
          backgroundColor: ColorsPalette.greyPalette200,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
            CircleAvatar(backgroundImage: AssetImage(widget.user.imageAsset)),
            const SizedBox(width: 10,),
            Column( 
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                Text(widget.user.name, style:  TextStyleMeetime.black45text18
                )
              ]
            )
          ],)
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView.builder(
                  reverse: true,
                  itemCount: chats.length,
                  itemBuilder: (BuildContext context, int index){
                    final Message message = messages[index];
                    bool isMe = message.sender.id == currentUser.id;
                  return _buildMessage(message, isMe);
                }
                
                ),
              ),
            ),
            _buildMessageSender(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageSender(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 80,
      color: ColorsPalette.greyPaletteshade50,
      child: Row(children: [
        Expanded(child: TextFormField(
          decoration: const InputDecoration(
            hintText: 'Mesaj',
          ),
        )),
        IconButton(onPressed: (){}, icon: const Icon(Icons.send))
      ]),
    );
  }

  Widget _buildMessage(Message message, bool isMe) {
    return Container(
      margin: isMe ? const EdgeInsets.only(top: 9.0, bottom: 9.0, left: 90.0) : const EdgeInsets.only(
        bottom: 9.0, right: 90.0, top: 9.0
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: isMe ? ColorsPalette.pinkPalette100 : ColorsPalette.greyPalette200,
        borderRadius: const BorderRadius.all(Radius.circular(30))
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(message.text, style: TextStyleMeetime.black54text18,),
          Text(message.time, style: TextStyleMeetime.black38text16,),
        ],
      )
    );
  }
}