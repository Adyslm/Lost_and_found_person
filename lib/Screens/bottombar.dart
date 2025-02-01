import 'package:ethar_app/Screens/Home.dart';
import 'package:ethar_app/Screens/ProfileScreen.dart';
import 'package:ethar_app/Screens/RegistreScreen.dart';
import 'package:ethar_app/Screens/Search.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selected = 0;

  final List<Widget> pageList = [
    HomeScreen(),
    SearchScreen(),
    RegistreScreen(),
    ProfileScreen()
  ];

  void selectedPage(int index) {
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selected],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recherch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Register',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
