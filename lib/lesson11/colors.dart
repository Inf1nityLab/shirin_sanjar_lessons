
import 'package:flutter/material.dart';

Color red = Colors.red;

class IconButtonWidget extends StatelessWidget {
  final IconData iconData;
  const IconButtonWidget({super.key,  required this.iconData});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){}, icon: Icon(iconData, color: Colors.red,));
  }
}

