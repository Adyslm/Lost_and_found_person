import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
 const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                          validator: (value) {
                            if (value!.isEmpty || value.contains('@gmail.com')) {
                              return 'Enter a vlaidate email';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            hintText: 'E-mail',
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
                        if(formkey.currentState!.validate()){
                          
                        }
                      },
                      child: Text(
                        'Reset Password',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Text('Cree un nouvelle compte'),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
