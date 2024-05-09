import 'package:chat_app_2/constant.dart';
import 'package:chat_app_2/cubits/chat_page_cubit/chat_page_cubit.dart';
import 'package:chat_app_2/cubits/cubit/login_cubit.dart';
import 'package:chat_app_2/helpers/show_snake.dart';
import 'package:chat_app_2/views/chat_page.dart';
import 'package:chat_app_2/views/register_page.dart';
import 'package:chat_app_2/widgets/custom_botum.dart';
import 'package:chat_app_2/widgets/custom_text_file.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static String id = "Login Page";

  @override
  Widget build(BuildContext context) {
    bool isLoading = BlocProvider.of<LoginCubit>(context).isLoading;
    String? email = BlocProvider.of<LoginCubit>(context).cubitEmail;
    String? password = BlocProvider.of<LoginCubit>(context).cubitPassword;
    GlobalKey<FormState> formKey = GlobalKey();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatPageCubit>(context).getMassage();
          isLoading = false;
          Navigator.pushReplacementNamed(context, ChatPage.id,
              arguments: email);
        } else if (state is LoginFailure) {
          isLoading = false;
          showSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
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
                    CustomBotum(
                        ontap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).signInMethod(
                              email: email,
                              password: password,
                            );
                          }
                        },
                        text: 'Sing In'),
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
      },
    );
  }
}
