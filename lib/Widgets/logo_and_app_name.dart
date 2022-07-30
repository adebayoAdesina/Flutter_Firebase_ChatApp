import 'package:firebase_chat_app/Util/colors.dart';
import 'package:flutter/material.dart';

class LogoAndAppName extends StatefulWidget {
  const LogoAndAppName({
    Key? key,
  }) : super(key: key);

  @override
  State<LogoAndAppName> createState() => _LogoAndAppNameState();
}

class _LogoAndAppNameState extends State<LogoAndAppName>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 1), upperBound: 1);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);
    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: 'logo',
          child: Image(
            image: const AssetImage('assets/images/R.png'),
            width: animation.value *100,
          ),
        ),
        Column(
          children: [
            RichText(
                text: const TextSpan(children: [
              TextSpan(
                text: 'Fire',
                style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'base',
                style: TextStyle(
                    color: kRedColor,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold),
              ),
            ])),
            const Text(
              'Chat',
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ],
    );
  }
}
