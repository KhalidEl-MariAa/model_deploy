import 'package:flutter/material.dart';



class Customtextfield extends StatelessWidget {
  const Customtextfield(
      {super.key,
      required this.hintText,
      this.keyboardType,
      this.onChanged,
      this.controller,
      this.validator, this.prefixIcon, required this.borderColor, this.hintTextStyle, this.maxLines, this.textAlign, this.raduis, this.suffixIcon, required this.obscure});
  final String hintText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final Color borderColor;
  final TextStyle? hintTextStyle;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? raduis;
  final Widget? suffixIcon;
  final bool obscure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      textAlign:textAlign?? TextAlign.start ,
      maxLines: obscure?1: maxLines,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintStyle:hintTextStyle,
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(raduis?? 10),
          borderSide:  BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(raduis?? 10),
          borderSide:  BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(raduis?? 10),
          borderSide:  BorderSide(color:borderColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(raduis??10),
          borderSide:  BorderSide(color: borderColor),
        ),
      ),
    );
  }
}