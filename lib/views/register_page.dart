import 'package:chat_app_2/constant.dart';
import 'package:chat_app_2/helpers/show_snake.dart';
import 'package:chat_app_2/views/chat_page.dart';
import 'package:chat_app_2/widgets/custom_botum.dart';
import 'package:chat_app_2/widgets/custom_text_file.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static String id = "Register Page";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: KMainColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 48,
                ),
                Image.asset(
                  KAppImage,
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
                CustomTextFormField(
                  onchanged: (value) {
                    email = value;
                  },
                  hintText: "Email",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  obscure: true,
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
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await registerMethod();
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, ChatPage.id);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            // ignore: use_build_context_synchronously
                            showSnackBar(
                                context, 'The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            // ignore: use_build_context_synchronously
                            showSnackBar(context,
                                'The account already exists for that email.');
                          } else {
                            // ignore: use_build_context_synchronously
                            showSnackBar(context, e.toString());
                          }
                        } catch (e) {
                          // ignore: use_build_context_synchronously
                          showSnackBar(context, e.toString());
                        }
                        isLoading = false;
                        setState(() {});
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
        ),
      ),
    );
  }

  Future<void> registerMethod() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    
  }
}
