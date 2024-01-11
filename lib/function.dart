import 'package:flutter/material.dart';

import 'package:shirin_sanjar_lessons/if_screen.dart';

class FunctionScreen extends StatefulWidget {
  const FunctionScreen({super.key});

  @override
  State<FunctionScreen> createState() => _FunctionScreenState();
}

class _FunctionScreenState extends State<FunctionScreen> {
  // Функции или методы

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email = 'baias@mail.ru';
  String password = 'test12345';
  String text ='';

  void signUp() {
    if (email == emailController.text && password == passwordController.text) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const IfScreen(),),);
    } else{
      setState(() {
        text= 'Пароль или имейл не правильный';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              textField('email', Icons.email, emailController),
              const SizedBox(
                height: 20,
              ),
              textField('password', Icons.lock, passwordController),
              const SizedBox(
                height: 40,
              ),
              button('Sign in', () {signUp();}),
              SizedBox(
                height: 20,
              ),
              button('Enter as guest', () {}),
              Text('$text')
            ],
          ),
        ),
      ),
    );
  }

  //Функции нужны чтобы не повторять один и тот же код
  Widget textField(
      String text, IconData iconData, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: text,
          prefixIcon: Icon(iconData)),
    );
  }

  Widget button(String text, Function() onTap) {
    return ElevatedButton(onPressed: onTap, child: Text(text));
  }
}
