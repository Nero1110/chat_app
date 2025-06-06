import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/sign_up_page.dart';
import 'package:chat_app/services/SigninUser.dart';
import 'package:chat_app/services/popUpmessage.dart';
import 'package:chat_app/widgets/Custom_Button.dart';
import 'package:chat_app/widgets/Custom_Text_Field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static String Id = "LoginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? Email;
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
                    "Sign In",
                    style: TextStyle(fontSize: 27, color: Color(0xffD0DCE7)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFieldWidget(
                    onChanged: (data) {
                      Email = data;
                    },
                    hintText: "Email",
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomTextFieldWidget(
                    onChanged: (data) {
                      Password = data;
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
                            await SigninUser(Email, Password);
                            Navigator.pushNamed(context,ChatPage.id,arguments: Email);
                            print(context);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              popUpmessage(
                                  context, 'No user found for that email.');
                              print(context);
                            } else if (e.code == 'wrong-password') {
                              popUpmessage(context,
                                  'Wrong password provided for that user');
                              print(context);
                            } else {
                              popUpmessage(
                                  context, e.message ?? 'Firebase error');
                            }
                          } catch (e) {
                            popUpmessage(context, "There was an error");
                          }
                          isbool = false;
                          setState(() {});
                        }
                      },
                      text: "Sign In"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "don't have an account?",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, SignUpPage.Id),
                        child: Text(
                          " Sign Up",
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
