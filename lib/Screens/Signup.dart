import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ethar_app/Screens/Home.dart';
import 'package:ethar_app/Screens/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final name = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final phonum = TextEditingController();
  bool isloading = false;

  void signup() async {
    setState(() {
      isloading = true;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: phonum.text);
      await FirebaseFirestore.instance
          .collection('useres')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
            'name': name.text,
            'email': email.text,
            'id': FirebaseAuth.instance.currentUser!.uid,
            'Lostperson':[],
            'Foundperson':[]
          });

      setState(() {
        isloading = false;
      });
    } on FirebaseException catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }

  @override
  void dispose() {
    name.dispose();
    username.dispose();
    email.dispose();
    phonum.dispose();
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
                          controller: name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter a valide name!';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            hintText: 'Name',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                          controller: username,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter a valide user name!';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            hintText: 'user name',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty ||
                                value.contains('@gmail.com')) {
                              return 'Enter a valide email!';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            hintText: 'e-mail',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                          controller: phonum,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter a valide number!';
                            }
                            if (!RegExp(r"^\d{8}$").hasMatch(value)) {
                              return 'Enter a valide phone number from';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            hintText: 'phone number',
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
                          signup();
                        }
                      },
                      child: isloading
                          ? CircularProgressIndicator()
                          : Text(
                              'Sign up',
                              style: TextStyle(color: Colors.white),
                            )),
                ),
                Text('do you have account?'),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Text('Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
