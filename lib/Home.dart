import 'package:flutter/material.dart';
import 'com.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isPasswordInvisible1 = true;
  bool isPasswordInvisible2 = true;
  String? _password, _confirmPassword;

  final pass = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
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
                            "Register",
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
                                return "please enter your name";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              prefixIcon: Icon(Icons.account_circle),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: InputBorder.none,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter your phone";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Phone',
                              prefixIcon: Icon(Icons.phone),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: InputBorder.none,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) => validateEmail(value!),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Enter email',
                              prefixIcon: Icon(Icons.email),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: InputBorder.none,
                            ),
                          ),
                          SizedBox(
                            height: 10,
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
                            controller: pass,
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
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter your pass";
                              }
                              if (value != _password) {
                                return 'Passwords do not match.';
                              }
                              _confirmPassword = value;

                              return null;
                            },
                            obscureText: isPasswordInvisible2,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              prefixIcon: Icon(Icons.lock),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPasswordInvisible2 =
                                          !isPasswordInvisible2;
                                    });
                                  },
                                  icon: Icon(isPasswordInvisible2
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              width: double.infinity,
                              height: 40,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      Navigator.pushNamed(context, 'registor');
                                    }
                                  },
                                  child: Text(
                                    "registor",
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 17, 75, 122),
                                  ))),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              width: double.infinity,
                              height: 40,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'login');
                                  },
                                  child: Text(
                                    "Login",
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
