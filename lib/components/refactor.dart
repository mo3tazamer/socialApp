import 'package:flutter/material.dart';

Widget defultFormField({
  required String label,
  required bool obscureText,
  required String hintText,
  required Icon sufficons,
  required TextEditingController controller,
  Function? onTap,
  Function? onchange,
  required String validatormessage,
}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: TextFormField(
      onChanged: (value) {
        onchange;
      },
      validator: (String? value) {
        if (value!.isEmpty) {
          return validatormessage;
        } else {}
      },
      obscureText: obscureText,
      controller: controller,
      onTap: onTap!(),
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: sufficons,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: (BorderRadius.circular(25))),
      ),
    ),
  );
}

Widget defultbottom({required String text, required Function onpress}) =>
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            onpress();
          },
          child: Text(text)),
    );
