import 'package:flutter/material.dart';

class customClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    Path path = Path();
    path.lineTo(0, h - 30);
    path.cubicTo(w / 2, h - 20, (w / 2), h, w, h * .9);

    path.lineTo(w, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

Widget myTextFormField({
  required String lableText,
  required Icon prefixicon,
  required double padding,
  required TextInputType keyboradType,
  IconData? suffixIcon,
  bool obscureText = false,
}) {
  return Padding(
      padding: EdgeInsets.all(padding),
      child: TextFormField(
          keyboardType: keyboradType,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: lableText,
            suffixIcon: suffixIcon != null
                ? IconButton(onPressed: () {}, icon: Icon(suffixIcon))
                : null,
          )));
}

String? validateEmail(String value) {
  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regExp = new RegExp(pattern);
  if (!regExp.hasMatch(value)) {
    return 'Invalid Email';
  } else {
    return null;
  }
}
