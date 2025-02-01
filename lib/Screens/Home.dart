import 'package:ethar_app/Widgets/productWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.man, 'title': 'Men'},
    {'icon': Icons.woman, 'title': 'Women'},
    {'icon': Icons.child_care, 'title': 'Children'}
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Text(
              'Lost and found Personns',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Icon(categories[index]['icon']),
                        Text(categories[index]['title']),
                        SizedBox(
                          width: 120,
                        ),
                      ],
                    );
                  }),
            ),
            Text(
              'List of Personns',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            GridView.count(
              childAspectRatio: 4.5/7,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(5, (index) {
                return ProductWidget();
              }),
            )
          ]),
        ),
      ),
    );
  }
}
