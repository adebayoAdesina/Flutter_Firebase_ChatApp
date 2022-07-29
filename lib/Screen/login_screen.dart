import 'package:firebase_chat_app/Util/colors.dart';
import 'package:firebase_chat_app/Widgets/logo_and_app_name.dart';
import 'package:firebase_chat_app/Widgets/welcome_button.dart';
import 'package:flutter/material.dart';

import '../Widgets/input_field.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LogoAndAppName(),
            InputField(
              text: 'Email',
              onChanged: (value) {
                print(value);
              },
              icon: Icons.email,
            ),
            InputField(
              text: 'Password',
              onChanged: (value) {
                print(value);
              },
              icon: Icons.email,
            ),
            const SizedBox(
              height: 10.0,
            ),
            WelcomeButton(
              text: 'Log in',
              color: kBlueColor.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
