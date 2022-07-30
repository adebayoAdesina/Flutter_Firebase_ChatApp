import 'package:flutter/material.dart';

import '../Util/colors.dart';

class InputField extends StatefulWidget {
  bool obscureText;
  final String text;
  final ValueChanged onChanged;
  final IconData icon;
  final TextInputType keyboardType;
  InputField({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.icon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool color = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: color == false ? Colors.white.withOpacity(0.32) : Colors.red,
        ),
      ),
      child: TextField(
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        onTap: () {
          setState(() {
            color = true;
          });
        },
        cursorColor: kRedColor,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.text,
          icon: Icon(
            widget.icon,
            color: kRedColor,
          ),
          suffixIcon: widget.icon == Icons.looks
              ? IconButton(
                  onPressed: (() {
                    setState(
                      () {
                        widget.obscureText = false;
                      },
                    );
                  }),
                  icon: const Icon(
                    Icons.password,
                    color: kWhiteColor,
                    size: 14,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
