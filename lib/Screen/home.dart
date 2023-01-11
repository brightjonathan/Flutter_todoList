import 'package:flutter/material.dart';
import 'package:my_note/Constants/colours.dart'; //colour folder
import '../List_items/todo_items.dart'; //todoitem folders 

class Home extends StatelessWidget {
  const Home({super.key});

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
              const Icon(
                Icons.menu,
                color: tdBlack,
                size: 40,
              ),
              Container(
                height: 40,
                width: 40,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assests/images/avatar.jpeg')),
              )
            ],
          )
          ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15
          ),
        child: Column(children: [          
          //search box 
          searchBox(),

          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50, bottom: 20),
                  child: const  Text('ALL TODOs',
                  style:  TextStyle(
                  fontSize: 30, 
                  fontWeight:  FontWeight.w500
                  ),
                  ),
                ),

                //list items 
                Todo_items() 
              ],
            ),
          )
        ]),
      ),
    );
  }
}



//search box widget created 
Widget searchBox() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, ),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: const TextField(
      decoration:  InputDecoration(
        contentPadding:  EdgeInsets.all(0),
        prefixIcon:   Icon(
          Icons.search,
          color: tdBlack,
          size: 30,
        ),
        prefixIconConstraints:  BoxConstraints(
          maxHeight: 25, 
          minHeight: 25
          ),
        border: InputBorder.none,
        hintText: 'Search...',
        hintStyle:  TextStyle(color: tdGrey, fontSize: 20),
      ),
    ),
  );
}


