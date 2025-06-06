import 'package:chat_app/services/popUpmessage.dart';
import 'package:chat_app/services/registerUser.dart';
import 'package:chat_app/widgets/Custom_Button.dart';
import 'package:chat_app/widgets/Custom_Text_Field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});
  static String Id = "SignUpPage";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? email;

  String? Password;

  GlobalKey<FormState> formstate = GlobalKey();

  bool isbool = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isbool,
      child: Scaffold(
        backgroundColor: Color(0xff274460),
        body: SizedBox(
          height: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formstate,
              child: ListView(
                children: [
                  SizedBox(
                    height: 130,
                  ),
                  Image.asset(
                    "assets/images/scholar.png",
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Center(
                      child: Text(
                        "Scholar Chat",
                        style: TextStyle(
                            fontSize: 32,
                            fontFamily: "Pacifico",
                            color: Color(0xffFDFFFF)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 140,
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 27, color: Color(0xffD0DCE7)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFieldWidget(
                    onChanged: (content) {
                      email = content;
                    },
                    hintText: "Email",
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomTextFieldWidget(
                    onChanged: (content) {
                      Password = content;
                    },
                    hintText: "Password",
                    obsecure: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    action: () async {
                      if (formstate.currentState!.validate()) {
                        try {
                          isbool = true;
                          setState(() {});
                          await registerUser(email, Password);
                          popUpmessage(
                              context, "Registered Successfully");
                              print(context);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            popUpmessage(context, "weak password");
                          } else if (e.code == 'email-already-in-use') {
                            popUpmessage(
                                context, "email is already used");
                          }
                        } catch (e) {
                          popUpmessage(context, "There was an error");
                        }
                        isbool = false;
                        setState(() {});
                      }
                    },
                    text: "Register",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "have an account?",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          " Sign in",
                          style:
                              TextStyle(fontSize: 15, color: Color(0xffD0DCE7)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
