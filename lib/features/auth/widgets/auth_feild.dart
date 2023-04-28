import 'package:flutter/material.dart';
import 'package:twitter/theme/palette.dart';

class AuthFeild extends StatelessWidget {
  const AuthFeild({super.key,required this.controller,required this.hintText});
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller,
      decoration: InputDecoration(
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color:Pallete.blueColor,
            width: 3,
          )
        ),
        enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color:Pallete.greyColor,
              width: 3,
            )
        ),
        contentPadding: const EdgeInsets.all(22),
        hintText:hintText,
        hintStyle: const TextStyle(
          fontSize: 18
        ),
      ),
    );
  }
}
