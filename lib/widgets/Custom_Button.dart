import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({
    super.key,required this.text,this.action
  });
  final String text;
  VoidCallback ?action;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      width: double.infinity,
      height: 40,
      child: Center(
        child: GestureDetector(
          onTap:action ,
          child: Text(
            text,
            style: TextStyle(color: Color(0xff274460), fontSize: 20),
          ),
        ),
      ),
    );
  }
}