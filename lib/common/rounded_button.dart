import 'package:flutter/material.dart';
import 'package:twitter/theme/palette.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key,required this.onTap,required this.label, this.textColor=Pallete.backgroundColor
  , this.backgroundColor=Pallete.whiteColor});
  final VoidCallback onTap;
  final String label;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Chip(label:Text(label,style: TextStyle(
        color:textColor,
        fontSize: 16,


      ),
      ),labelPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
      backgroundColor:backgroundColor,),
    );
  }
}
