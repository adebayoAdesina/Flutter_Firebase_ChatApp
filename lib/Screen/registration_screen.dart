import 'package:flutter/material.dart';

import '../Util/colors.dart';
import '../Widgets/input_field.dart';
import '../Widgets/logo_and_app_name.dart';
import '../Widgets/welcome_button.dart';

class RegistrationScreen extends StatelessWidget {
  static const String id = '/registration';
  const RegistrationScreen({Key? key}) : super(key: key);

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
              onChanged: (value) {
                print(value);
              },
              icon: Icons.email,
            ),
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
            InputField(
              text: 'Confirm Password',
              onChanged: (value) {
                print(value);
              },
              icon: Icons.email,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const WelcomeButton(
              text: 'Sign up',
              color: kBlueColor,
            ),
          ],
        ),
      ),
    );
  }
}
