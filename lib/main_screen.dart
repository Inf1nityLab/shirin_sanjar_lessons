import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){}, child: Text('Firts Project ')),
          ElevatedButton(onPressed: (){}, child: Text('Second project'))
        ],
      ),
    );
  }
}

