import 'package:firebase_auth/firebase_auth.dart';

Future<void> SigninUser(String? Email,String ?Password) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: Email!, password: Password!);
  }