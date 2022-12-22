import 'package:flutter/material.dart';

void navigateto({required context, required widget}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateandfinish({context, required widget}) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (route) => false,
  );
}
