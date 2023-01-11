import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_note/Constants/colours.dart'; 

class Todo_items extends StatelessWidget {
  const Todo_items({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {},

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(Icons.check_box, color: tdBlue),
        title: Text('check my mail', 
        style: TextStyle(
          fontSize: 16,
          color: tdBlack,
          decoration: TextDecoration.lineThrough,
        )
        ),
      ),
    );
  }
}

