import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:library_app/utils/themes/constants.dart';

class InputWidget extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final IconData icon;
  final TextInputType textInputType;
  final Function(String) validator;
  final List<TextInputFormatter> inputFormatter;
  final Function(String) onChanged;
  final TextEditingController controller;

  const InputWidget(
      {Key key,
      this.hintText,
      this.obscureText = false,
      this.icon,
      this.textInputType,
      this.validator,
      this.inputFormatter,
      this.onChanged,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      //TODO:
      inputFormatters: inputFormatter,
      obscureText: obscureText,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: lightGray),
            borderRadius: BorderRadius.circular(20.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: lightGreen),
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: Icon(icon),
          hintText: "$hintText"),
    );
  }
}
