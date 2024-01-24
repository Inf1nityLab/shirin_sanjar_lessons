import 'package:flutter/material.dart';
import 'package:shirin_sanjar_lessons/constants/colors.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  List<Widget> screens = const [H(), J(), D()];

  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: green,
        unselectedItemColor: Colors.red,
        backgroundColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile')
        ],
      ),
    );
  }
}

class H extends StatelessWidget {
  const H({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: const Text('Home'));
  }
}

class J extends StatelessWidget {
  const J({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: const Text('Search'));
  }
}

class D extends StatelessWidget {
  const D({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

      ],
    );
  }
}
