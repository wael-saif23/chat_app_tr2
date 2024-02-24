import 'package:chat_app_2/constant.dart';
import 'package:chat_app_2/widgets/custom_botum.dart';
import 'package:chat_app_2/widgets/custom_text_file.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static String id = "Register Page";
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
            const CustomTextFile(
              hintText: "Email",
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextFile(
              hintText: "Password",
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomBotum(),
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
