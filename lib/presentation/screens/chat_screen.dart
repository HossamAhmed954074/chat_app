import 'dart:developer';
import '../../constraints/my_colors.dart';
import '../../constraints/strings.dart';
import '../../data/models/message_model.dart';
import '../widgets/custom_bubble_chat_get.dart';
import '../widgets/custom_bubble_chat_post.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
 
  CollectionReference messages = FirebaseFirestore.instance.collection(
    KMessage,
  );
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var emailadress = ModalRoute.of(context)!.settings.arguments;
    log(ModalRoute.of(context)!.settings.arguments.toString());
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(KcreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          //  Map<String, dynamic> data = snapshot.data?.docs as Map<String, dynamic> ;
          List<MessageModel> messageList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
          }
          return ChatsListViewBuilder(
            chats: messageList,
            controller: controller,
            messages: messages,
            email: emailadress,
          );
        } else {
          return ChatsListViewBuilder(
            chats: [MessageModel('Not Have A Message', "emailadress")],
            controller: controller,
            messages: messages,
            email: emailadress,
          );
        }
      },
    );
  }
}

// ignore: must_be_immutable
class ChatsListViewBuilder extends StatelessWidget {
  ChatsListViewBuilder({
    super.key,
    required this.controller,
    required this.messages,
    required this.chats,
    required this.email,
  });
  final List<MessageModel> chats;
  final TextEditingController controller;
  final CollectionReference<Object?> messages;
  final _controller = ScrollController();
  var email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: Image.asset(kImageApp, fit: BoxFit.contain),
            ),
            Text('Chat', style: TextStyle(fontFamily: 'Pacifico')),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              controller: _controller,
              physics: BouncingScrollPhysics(),
              itemCount: chats.length,
              itemBuilder:
                  (context, index) =>
                      email == chats[index].id
                          ? CustomBubbleChatGet(masseage: chats[index].message)
                          : CustomBubbleChatPost(
                            masseage: chats[index].message,
                          ),
            ),
          ),
          SendMasseageTextFaildCustomWidget(
            controller: controller,
            messages: messages,
            scrollController: _controller,
            email: email,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class SendMasseageTextFaildCustomWidget extends StatelessWidget {
  SendMasseageTextFaildCustomWidget({
    super.key,
    required this.controller,
    required this.messages,
    required this.scrollController,
    required this.email,
  });
  final ScrollController scrollController;
  final TextEditingController controller;
  final CollectionReference<Object?> messages;
  var email;
  var textt;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0, top: 8, right: 8, left: 8),
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          textt = value;
          // messages.add({KMessage: value, KcreatedAt: DateTime.now()});
          // controller.clear();
          // scrollController.animateTo(
          //   0,
          //   duration: Duration(milliseconds: 200),
          //   curve: Curves.fastOutSlowIn,
          // );
        },
        decoration: InputDecoration(
          hintText: 'Send Massege',
          suffixIcon: IconButton(
            onPressed: () {
              if (textt != null) {
                messages.add({
                  KMessage: textt,
                  KcreatedAt: DateTime.now(),
                  'Id': email,
                });
                controller.clear();
                scrollController.animateTo(
                  0,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                );
              }
            },
            icon: Icon(Icons.send, color: kPrimaryColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
