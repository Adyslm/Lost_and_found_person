import 'package:ethar_app/Widgets/ElevatedBottom.dart';
import 'package:flutter/material.dart';

class Personnedetaills extends StatelessWidget {
  const Personnedetaills({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 40,),
              Image.network(
                'https://th.bing.com/th/id/R.ffc2adcb86ed3f7689bb24df653691d3?rik=O0sub3JhL9x5Ew&pid=ImgRaw&r=0',
                width: double.infinity,
                height: height*0.5,
              ),
              Text('Sidi',style: TextStyle(fontSize: 20),),
              SizedBox(height: 25,),
              Text('Lost at Toujounine arround 11h Am have 55 years',style: TextStyle(fontSize: 18),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedWidget(title: 'Add like Found', color: Colors.blue, function: (){})
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
