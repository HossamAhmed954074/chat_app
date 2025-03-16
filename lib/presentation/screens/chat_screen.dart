import 'dart:developer';

import 'package:chat_app/cubits/chat_cubit/cubit/chat_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constraints/my_colors.dart';
import '../../constraints/strings.dart';
import '../widgets/custom_bubble_chat_get.dart';
import '../widgets/custom_bubble_chat_post.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChatsListViewBuilder(controller: controller);
  }
}

// ignore: must_be_immutable
class ChatsListViewBuilder extends StatelessWidget {
  ChatsListViewBuilder({super.key, required this.controller});
  final TextEditingController controller;
  // final CollectionReference<Object?> messages;
  final _controller = ScrollController();
  var email;

  @override
  Widget build(BuildContext context) {
    email = ModalRoute.of(context)!.settings.arguments;
    log(email.toString());
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
            child: BlocBuilder<ChatCubit, ChatState>(
             
              builder: (context, state) {

                var chats = BlocProvider.of<ChatCubit>(context).list;
                return ListView.builder(
                  reverse: true,
                  controller: _controller,
                  physics: BouncingScrollPhysics(),
                  itemCount: chats.length,
                  itemBuilder:
                      (context, index) =>
                          email == chats[index].id
                              ? CustomBubbleChatGet(
                                masseage: chats[index].message,
                              )
                              : CustomBubbleChatPost(
                                masseage: chats[index].message,
                              ),
                );
              },
            ),
          ),
          SendMasseageTextFaildCustomWidget(
            controller: controller,
            // messages: messages,
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
    required this.scrollController,
    required this.email,
  });
  final ScrollController scrollController;
  final TextEditingController controller;
  // final CollectionReference<Object?> messages;
  var email;
  String? message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0, top: 8, right: 8, left: 8),
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          message = value;
        },
        decoration: InputDecoration(
          hintText: 'Send Massege',
          suffixIcon: IconButton(
            onPressed: () {
              if (message != null) {
                BlocProvider.of<ChatCubit>(
                  context,
                ).sendMessage(message: message!, email: email);
                //todo add masseage
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
