import 'package:flutter/material.dart';
import 'com.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isPassword = true;
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
                          TextField(
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
                          TextField(
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
                              return null;
                            },
                            controller: pass,
                            obscureText: isPassword,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPassword = !isPassword;
                                    });
                                  },
                                  icon: Icon(isPassword
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
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              suffix: Icon(Icons.remove_red_eye),
                              labelText: 'Confirm Password',
                              prefixIcon: Icon(Icons.lock),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: InputBorder.none,
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
                                      print(pass.text);
                                    }
                                  },
                                  child: Text(
                                    "Login",
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
