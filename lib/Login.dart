import 'package:flutter/material.dart';
import 'com.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  final formKey = GlobalKey<FormState>();
  bool isPasswordInvisible1 = true;
  String? _password;

  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    ClipPath(
                      clipper: customClipPath(),
                      child: Container(
                        height: 250,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 50,
                                color: Colors.white),
                          ),
                        ),
                        color: Color.fromARGB(255, 17, 75, 122),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter your email";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.account_circle),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: InputBorder.none,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter your pass";
                              }
                              if (value.length < 8) {
                                return 'Password must be at least 8 characters long.';
                              }
                              _password = value;
                              return null;
                            },
                            obscureText: isPasswordInvisible1,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPasswordInvisible1 =
                                          !isPasswordInvisible1;
                                    });
                                  },
                                  icon: Icon(isPasswordInvisible1
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: InputBorder.none,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                              width: double.infinity,
                              height: 40,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'registor');
                                  },
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 17, 75, 122),
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white54))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
