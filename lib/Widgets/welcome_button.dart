import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  final String text;
  final Color color;
  const WelcomeButton({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.88,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            blurRadius: 40,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        text,
      ),
    );
  }
}
