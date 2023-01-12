import 'package:flutter/material.dart';
import 'package:my_note/Constants/colours.dart'; //colour folder
import '../List_items/todo_items.dart'; //todoitem folders
import '../Model/todo_model.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //imported the todolist from model
  final todoList = toDo.todoList();
  final _textController = TextEditingController();
  List<toDo> _foundToDo = [];

  @override
  void initState() {
    _foundToDo = todoList;
    super.initState();
  }

//handles the check box functionality
  void _handleToDoChange(toDo todo) {
    setState(() {
      todo.isComplete = !todo.isComplete;
    });
  }

//delete functionality
  void _handleDelete(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

//adding the add todo functionality
  void _addTodoItems(String todo) {
    setState(() {
      todoList.add(toDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: todo));
    });

    //to clear the input field
    _textController.clear();
  }

//functionality for filtering or search functionality...
  void _runFilter (String enteredKeyword) {
    List<toDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(115, 41, 40, 40),

      //appBar ui
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
          )),
      body: Stack(children: [

        //search
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(children: [
            Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child:  TextField(
              style: TextStyle(fontSize: 20),
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: tdBlack,
                  size: 30,
                ),
                prefixIconConstraints: BoxConstraints(maxHeight: 25, minHeight: 25),
                border: InputBorder.none,
                hintText: 'Search...',
                hintStyle: TextStyle(color: tdGrey, fontSize: 20),
              ),
            ),
          ),

            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 20),
                    child: const Text(
                      'ALL TODOs',
                      style:
                          TextStyle(fontSize: 30, 
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 255, 255, 255)
                          ),
                    ),
                  ),

                  //list items
                  for (toDo todoo in _foundToDo.reversed)
                    Todo_items(
                      todo: todoo,
                      onTodoChange: _handleToDoChange,
                      onDeleteItem: _handleDelete,
                    ),
                ],
              ),
            )
          ]),
        ),


        //this for the input field bottom
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(children: [
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(
                bottom: 20,
                right: 20,
                left: 20,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: _textController,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: 'Add a todo item...',
                  hintStyle: TextStyle(fontSize: 20),
                  border: InputBorder.none,
                ),
              ),
            )),
            Container(
              margin: const EdgeInsets.only(bottom: 20, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  _addTodoItems(_textController.text);
                },
                child: const Text(
                  '+',
                  style: TextStyle(fontSize: 40),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: tdBlue,
                  minimumSize: Size(60, 60),
                  elevation: 10,
                ),
              ),
            )
          ]),
        )
      ]),
    );
  }
}

