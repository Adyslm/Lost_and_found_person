import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final Password = TextEditingController();
  bool isloading = false;

  void login() async {
    setState(() {
      isloading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          password: Password.text, email: email.text);
      setState(() {
        isloading = false;
      });

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomAppBar()));


    } on FirebaseException catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));

          setState(() {
        isloading = false;
      });
    }
  }

  @override
  void dispose() {
    email.dispose();
    Password.dispose();
    super.dispose();
  }

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Lost and found Personns',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter a vlaidate email';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            hintText: 'email',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                          controller: Password,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter a vlaidate password';
                            }
                            if (!RegExp(r"^\d{8}$").hasMatch(value)) {
                              return 'Enter a vlaidate password form';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            hintText: 'Password',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[900]),
                      onPressed: () {
                        formkey.currentState?.save();
                        if (formkey.currentState!.validate()) {
                          login();
                        }
                      },
                      child:isloading? CircularProgressIndicator(): Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Text('Create account'),
                TextButton(onPressed: () {}, child: Text('Sign up'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
