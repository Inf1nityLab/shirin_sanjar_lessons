import 'package:flutter/material.dart';
import 'constants/strings.dart';

class Lesson03 extends StatefulWidget {
  const Lesson03({super.key});

  @override
  State<Lesson03> createState() => _Lesson03State();
}

class _Lesson03State extends State<Lesson03> {
  // Функции или методоми


  void nameFunc() {}

  void signUp() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              textField(login, TextInputAction.next, Icons.email),
              const SizedBox(
                height: 20,
              ),
              textField(password, TextInputAction.done, Icons.lock),
              const SizedBox(
                height: 50,
              ),
              button('Login', () {}, Colors.green),
              const SizedBox(
                height: 20,
              ),
              button('Enter as guest', () {}, Colors.red)
            ],
          ),
        ),
      ),
    );
  }

// Функции нам нужны для того чтобы не повторять один и тот же код
  Widget textField(
      String text, TextInputAction textInputAction, IconData iconData) {
    return TextField(
      keyboardType: TextInputType.number,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        //labelText: text,
        hintText: text,
        hintStyle: const TextStyle(fontSize: 30),
        helperText: text,
        prefixIcon: Icon(iconData),
      ),
    );
  }

  Widget button(String text, Function() onTap, Color color) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
        ),
        child: Text(text),
      ),
    );
  }
}
