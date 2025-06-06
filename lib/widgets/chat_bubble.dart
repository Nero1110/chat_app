import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

class chat_bubble extends StatelessWidget {
  const chat_bubble({
    super.key,required this.message
  });
final  Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          margin: EdgeInsets.only(top: 10,right: 16,left: 16),
          padding: EdgeInsets.only(left: 10, top: 20, bottom: 20, right: 10),
          child: Text(
            message.message,
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
            color: Kcolor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          )),
    );
  }
}
