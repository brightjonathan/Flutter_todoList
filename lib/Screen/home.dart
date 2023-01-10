import 'package:flutter/material.dart';
import 'package:my_note/Constants/colours.dart';


class Home  extends StatelessWidget {
  const Home ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: tdBGColor,
        elevation: 0,
        title: Row( 
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Icon(
          Icons.menu,
          color: tdBlack,
          size: 40,
        ),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assests/images/avatar.jpeg')
          ),
        )
        ],)
      ),
      body: Container(
        child: Text('This is my home screen'),  
      ),
    );
  }
}



