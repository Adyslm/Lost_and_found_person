import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.add)),
              IconButton(onPressed: (){}, icon: Icon(Icons.follow_the_signs_rounded)),
            ],
          ),
          Image.network('https://www.shutterstock.com/shutterstock/photos/752963539/display_1500/stock-vector-silhouette-missing-person-with-stamp-752963539.jpg'),

          Text('Sidi',style: TextStyle(
            fontSize: 20,
          ),
          ),

           Text('20452581',style: TextStyle(
            fontSize: 18, color: Colors.blue
          ),
          )

        ],
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12)),
    );
  }
}