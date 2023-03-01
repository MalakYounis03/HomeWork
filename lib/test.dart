import 'package:flutter/material.dart';
import 'package:malak1/Register.dart';
import 'Home.dart';
//لو شفت الكود وتعديلاته على ال github
// ف انا بعتذر لانو نفس الملف كنت بدرس عليه من زمان و م عملت واحد جديد علشان هالتاسك

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    routes: {
      'registor': (context) => Register(),
    },
  ));
}
