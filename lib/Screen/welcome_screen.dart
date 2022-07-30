import 'package:firebase_chat_app/Screen/login_screen.dart';
import 'package:firebase_chat_app/Screen/registration_screen.dart';
import 'package:firebase_chat_app/Util/colors.dart';
import 'package:flutter/material.dart';

import '../Widgets/logo_and_app_name.dart';
import '../Widgets/welcome_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = '/welcome';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animationController.forward();
    animationController.addListener(() {
      setState(() {
        
      });
      print(animationController.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeData.dark().scaffoldBackgroundColor.withOpacity(animationController.value),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const LogoAndAppName(),
          const SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: (() {
              Navigator.pushNamed(context, LoginScreen.id);
            }),
            child: WelcomeButton(
              onTap: (){},
              text: 'Log in',
              color: kBlueColor.withOpacity(0.5),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: (() {
              Navigator.pushNamed(context, RegistrationScreen.id);
            }),
            child: WelcomeButton(
              onTap: (){},
              text: 'Sign up',
              color: kBlueColor,
            ),
          )
        ],
      ),
    );
  }
}
