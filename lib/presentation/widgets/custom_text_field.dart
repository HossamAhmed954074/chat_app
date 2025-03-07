// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldCustomWidget extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;
  bool obScure;
  Function(String) onSubmited;

  Function()? onPressedChangeScure;
  Icon icon;

  TextFormFieldCustomWidget({
    super.key,
    required this.hintText,
    required this.textInputType,
    required this.obScure,
    required this.icon,
    this.onPressedChangeScure,
    required this.onSubmited,
    
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
   
      // ignore: body_might_complete_normally_nullable
      validator: (value) {
        if (value!.isEmpty) {
          return 'field is requird';
        }
      },
      onChanged: onSubmited,
      keyboardType: textInputType,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 18),
      obscureText: obScure,
      decoration: InputDecoration(
        suffixIcon: IconButton(onPressed: onPressedChangeScure, icon: icon),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
