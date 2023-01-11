import 'package:flutter/material.dart';
import 'package:my_note/Constants/colours.dart';
import 'package:my_note/Model/todo_model.dart';

class Todo_items extends StatelessWidget {
  const Todo_items({super.key, required this.todo});

 //import from model
  final toDo todo; //

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isComplete ? Icons.check_box : Icons.check_box_outline_blank, 
          color: tdBlue
          ),
        title: Text(
          todo.todoText!,
            style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration: todo.isComplete ? TextDecoration.lineThrough : null,
            )
            ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: tdRed, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            onPressed: () {},
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}

