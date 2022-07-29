import 'package:flutter/material.dart';

import '../Util/colors.dart';

class InputField extends StatelessWidget {
  final String text;
  final ValueChanged onChanged;
  final IconData icon;
  const InputField({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.white.withOpacity(0.32),
        ),
      ),
      child: TextField(
        cursorColor: kRedColor,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: text,
          icon: Icon(
            icon,
            color: kRedColor,
          ),
        ),
      ),
    );
  }
}