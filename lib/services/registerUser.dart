import 'package:firebase_auth/firebase_auth.dart';

Future<void> registerUser(String ?email,String ?Password) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: Password!,
    );
  }
