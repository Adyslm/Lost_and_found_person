import 'package:ethar_app/Screens/Add_personne.dart';
import 'package:ethar_app/Widgets/ListTileWidget.dart';
import 'package:flutter/material.dart';

class RegistreScreen extends StatefulWidget {
  const RegistreScreen({super.key});

  @override
  State<RegistreScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<RegistreScreen> {
  get title => null;

  get icon => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Name@gmail.com',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ListtileWidget(
                  title: 'Lists of personne',
                  icon: Icons.request_page,
                  function: () {},
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                ),
                ListtileWidget(
                  title: 'Found',
                  icon: Icons.favorite,
                  function: () {},
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                ),
                ListtileWidget(
                  title: 'Add personne',
                  icon: Icons.add_circle,
                  function: () {
                    Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddPersonne()));
                    //print('la fonction est bien fonctionnell!');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
