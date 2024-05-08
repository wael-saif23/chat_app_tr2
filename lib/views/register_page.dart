import 'package:chat_app_2/constant.dart';

import 'package:chat_app_2/cubits/register/register_cubit.dart';
import 'package:chat_app_2/helpers/show_snake.dart';
import 'package:chat_app_2/views/chat_page.dart';

import 'package:chat_app_2/widgets/custom_botum.dart';
import 'package:chat_app_2/widgets/custom_text_file.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static String id = "Register Page";

  @override
  Widget build(BuildContext context) {
    bool isLoading = BlocProvider.of<RegisterCubit>(context).isLoading;
    String? email = BlocProvider.of<RegisterCubit>(context).cubitEmail;
    String? password = BlocProvider.of<RegisterCubit>(context).cubitPassword;
    GlobalKey<FormState> formKey = GlobalKey();
    return BlocConsumer<RegisterCubit,RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          isLoading = false;
          Navigator.pushReplacementNamed(context, ChatPage.id,
              arguments: email);
        } else if (state is RegisterFailure) {
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
                            BlocProvider.of<RegisterCubit>(context)
                                .registerMethod(
                                    email: email, password: password);
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
      },
    );
  }
}
