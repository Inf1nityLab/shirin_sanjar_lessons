import 'package:flutter/material.dart';

class Lesson10 extends StatelessWidget {
  const Lesson10({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> server = ['A', 'B', 'C', 'D', 'E'];
    List<String> names = ['Almaz', 'Bekten', 'Camilla', 'Donkey',];
    List<Color> colors = [Colors.red,Colors.deepPurple,Colors.green,Colors.deepOrange,];

    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          scrollDirection: Axis.vertical,
            itemCount: 40,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                ),
            itemBuilder: (context, index) {

              return Container(
                width: 200,
                height: 100,
                color: Colors.deepPurple,
                child: Center(child: Text('$index'))
              );
            }),
      ),
    );
  }
}
