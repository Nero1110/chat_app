import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  CustomTextFieldWidget({super.key, required this.hintText, this.onChanged,this.obsecure=false});
  final String hintText;
  Function(String content)? onChanged;
bool obsecure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obsecure ,
      validator: (value) {
        if (value!.isEmpty) {
          return "Field is required";
        }
      },
      onChanged: onChanged,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xffD0DCE7)),
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Color(0xff97AABB))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.blue))),
    );
  }
}
