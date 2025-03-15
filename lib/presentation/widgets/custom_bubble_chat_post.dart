import 'package:flutter/material.dart';

class CustomBubbleChatPost extends StatelessWidget {
 const CustomBubbleChatPost({required this.masseage, super.key});
  final String masseage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        padding: EdgeInsets.only(top: 14, bottom: 14, right: 10, left: 14),
        decoration: BoxDecoration(
          color: Color(0xff006D84),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        child: Text(masseage, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}