import 'package:firebase_chat_app/Resources/auth.dart';
import 'package:firebase_chat_app/Screen/chat_screen.dart';
import 'package:firebase_chat_app/Util/colors.dart';
import 'package:firebase_chat_app/Widgets/logo_and_app_name.dart';
import 'package:firebase_chat_app/Widgets/welcome_button.dart';
import 'package:flutter/material.dart';

import '../Util/utils.dart';
import '../Widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;

  void loginUser() async {
    AuthMethods authMethods = AuthMethods();
    String res = await authMethods.loginUser(
      email: email.toString(),
      password: password.toString(),
    );
    if (res == 'success') {
      Navigator.pushNamed(context, ChatScreen.id);
    } else {
      showSnapBar(res, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const LogoAndAppName(),
                  InputField(
                    keyboardType: TextInputType.emailAddress,
                    text: 'Email',
                    onChanged: (value) {
                      email = value;
                    },
                    icon: Icons.email,
                  ),
                  InputField(
                    text: 'Password',
                    onChanged: (value) {
                      password = value;
                    },
                    icon: Icons.looks,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  RawMaterialButton(
                    onPressed: (() => loginUser()),
                    child: WelcomeButton(
                      onTap: () {},
                      text: 'Log in',
                      color: kBlueColor.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
