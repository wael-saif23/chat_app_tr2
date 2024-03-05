import 'package:chat_app_2/constant.dart';
import 'package:chat_app_2/helpers/show_snake.dart';
import 'package:chat_app_2/views/chat_page.dart';
import 'package:chat_app_2/views/register_page.dart';
import 'package:chat_app_2/widgets/custom_botum.dart';
import 'package:chat_app_2/widgets/custom_text_file.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static String id = "Login Page";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  "Login",
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
                CustomBotum(ontap: () async{
                  if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await signInMethod();
                            // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, ChatPage.id,arguments: email);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              // ignore: use_build_context_synchronously
                              showSnackBar(
                                  context, 'user not found.');
                            } else if (e.code == 'wrong-password') {
                              // ignore: use_build_context_synchronously
                              showSnackBar(context,
                                  'wrong password.');
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
                }, text: 'Sing In'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don't have an acount?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(.7),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: Text(
                        "REGISTER",
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
  Future<void> signInMethod() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
