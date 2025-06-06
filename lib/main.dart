import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const chat_app());
}

class chat_app extends StatelessWidget {
  const chat_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
      LoginPage.Id: (context) => LoginPage(),
      SignUpPage.Id:(context) =>SignUpPage(),
      ChatPage.id:(context) => ChatPage()
    }, debugShowCheckedModeBanner: false, initialRoute: LoginPage.Id);
  }
}
