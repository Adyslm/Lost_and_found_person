import 'package:ethar_app/Screens/Add_personne.dart';
import 'package:ethar_app/Screens/Signup.dart';
import 'package:ethar_app/Screens/bottombar.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:ethar_app/Screens/Home.dart';
// import 'package:ethar_app/Screens/Personne_detaills.dart';
// import 'package:ethar_app/Screens/RegistreScreen.dart';
// import 'package:ethar_app/Screens/Signup.dart';
// import 'package:ethar_app/Screens/bottombar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return Text('error');
              }
              if (snapshot.data == null) {
                return SignupScreen();
              }

              if (snapshot.hasData) {
                return BottomBar();
              }
              return Text('');
            }));
  }
}
