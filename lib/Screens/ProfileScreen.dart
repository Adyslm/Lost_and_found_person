import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ethar_app/Screens/Login.dart';
import 'package:ethar_app/Widgets/ElevatedBottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('useres')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .get(),
                builder: (context, snapshot) {
                  final name = snapshot.data?.data()!['name'];
                  final email = snapshot.data?.data()!['email'];
                  if (snapshot.hasError) {
                    return Text('error');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          email,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Divider(
                          color: Colors.grey[300],
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue[900]),
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();

                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: Text(
                                'Sign out',
                                style: TextStyle(color: Colors.white),
                              ),
                            ))
                      ],
                    );
                  }

                  return Text('');
                }),
          ),
        ),
      ),
    );
  }
}
