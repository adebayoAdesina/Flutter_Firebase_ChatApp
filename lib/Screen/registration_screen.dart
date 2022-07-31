import 'package:firebase_chat_app/Resources/auth.dart';
import 'package:firebase_chat_app/Screen/chat_screen.dart';
import 'package:flutter/material.dart';

import '../Util/colors.dart';
import '../Util/utils.dart';
import '../Widgets/input_field.dart';
import '../Widgets/logo_and_app_name.dart';
import '../Widgets/welcome_button.dart';

enum Registration { fullName, email, password, confirmPassword }

class RegistrationScreen extends StatefulWidget {
  static const String id = '/registration';
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String? fullName;
  String? email;
  String? password;
  String? confirmPassword;

  void userInputs(Registration registration, String value) {
    switch (registration) {
      case Registration.fullName:
        setState(() {
          fullName = value;
        });
        break;
      case Registration.email:
        setState(() {
          email = value;
        });
        break;
      case Registration.password:
        setState(() {
          password = value;
        });
        break;
      case Registration.confirmPassword:
        setState(() {
          confirmPassword = value;
        });
        break;
      default:
    }
  }

  void registerUser() async {
    AuthMethods authMethods = AuthMethods();
    String res = await authMethods.signUpUser(
        email: email!, fullName: fullName!, password: password!);
    print({fullName, email, password, confirmPassword});
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LogoAndAppName(),
            InputField(
              text: 'Full Name',
              onChanged: (value) => userInputs(Registration.fullName, value),
              icon: Icons.email,
            ),
            InputField(
              text: 'Email',
              onChanged: (value) => userInputs(Registration.email, value),
              icon: Icons.email,
            ),
            InputField(
              text: 'Password',
              onChanged: (value) => userInputs(Registration.password, value),
              icon: Icons.looks,
              obscureText: true,
            ),
            InputField(
              text: 'Confirm Password',
              onChanged: (value) =>
                  userInputs(Registration.confirmPassword, value),
              icon: Icons.looks,
              obscureText: true,
            ),
            const SizedBox(
              height: 10.0,
            ),
            RawMaterialButton(
              onPressed: () => registerUser(),
              child: WelcomeButton(
                onTap: () {},
                text: 'Sign up',
                color: kBlueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
