 import 'package:flutter/material.dart';

void popUpmessage(BuildContext context, String text) {

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  duration: Duration(seconds: 2),  
      content: Text(text)));
  }