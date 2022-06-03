import 'package:flutter/material.dart';
import 'package:meetime_app/constant/colors.dart';
import 'package:meetime_app/constant/text_style.dart';
import 'package:meetime_app/messagepage/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constant/picture.dart';
import 'message_model.dart';


class MessagePage extends StatelessWidget {
  final String userId = "BM0jVr4xzaTatzCqhRxbgLWQAXb2";
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Firebase mesajlaşma altyapısı
    FirebaseFirestore.instance.collection('conversations').snapshots();
    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
      if(snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Text('Loading...');
    }
    
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Column(
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
              Center(
                  child: Text(
                "Mesajlar",
                style: TextStyleMeetime.black38text20,
              )),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: ColorsPalette.greyPaletteshade50,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: ListView.builder(
                      itemCount: chats.length,
                      itemBuilder: (BuildContext context, index) {
                        final Message chat = chats[index];
                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChatScreen(user: chat.sender),
                              )),
                          child: Container(
                            margin: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                                color: ColorsPalette.greyPaletteshade50,
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                            color: ColorsPalette.greyPalette300,
                                            offset: const Offset(4, 4),
                                            blurRadius: 4.0)
                                      ]),
                                  child: CircleAvatar(
                                    radius: 35.0,
                                    backgroundImage:
                                        AssetImage(chat.sender.imageAsset),
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(chat.sender.name,
                                        style: TextStyleMeetime.blacktext20),
                                    const SizedBox(height: 5.0),
                                    Container(
                                      decoration: BoxDecoration(
                                          color:
                                              ColorsPalette.greyPaletteshade50,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                            color: ColorsPalette.greyPalette200,
                                            width: 3,
                                          )),
                                      height: 42,
                                      width: MediaQuery.of(context).size.width *
                                          0.60,
                                      child: Center(
                                        child: Text(
                                          chat.text,
                                          style: TextStyleMeetime.black45text18,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 2.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        chat.time,
                                        style: TextStyleMeetime.black38text14,
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      chat.unread
                                          ? Container(
                                              width: 50,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: Colors.pink.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text('Yeni',
                                                  style: TextStyleMeetime
                                                      .whitetext14),
                                            )
                                          : SizedBox.shrink(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              )),
            ],
          ),
        ));
  }
}
}