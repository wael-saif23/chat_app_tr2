import 'package:chat_app_2/constant.dart';
import 'package:chat_app_2/widgets/custom_botum.dart';
import 'package:chat_app_2/widgets/custom_text_file.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  static String id = "Register Page";
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMainColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(
              height: 48,
            ),
            Image.asset(
              "assets/images/scholar.png",
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.3,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Chat App",
                  style: TextStyle(
                      fontFamily: KFontTextPacifico,
                      fontSize: 32,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            const Text(
              "REGISTER",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFile(
              onchanged: (value) {
                email = value;
              },
              hintText: "Email",
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFile(
              onchanged: (value) {
                password = value;
              },
              hintText: "Password",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomBotum(
                ontap: () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email!,
                      password: password!,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("sucsses"),
                      ),
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                text: 'Register'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "I have an acount!",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(.7),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.green.withOpacity(.7),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
