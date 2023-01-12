//creating a model for todolist

class toDo {
  String? id;
  String? todoText;
  bool isComplete;

  toDo({
    required this.id,
    required this.todoText,
    this.isComplete = false,
  });

  static List<toDo> todoList() {
    return [
      toDo(id: '01', todoText: 'Morning prayers', isComplete: true),
      toDo(id: '02', todoText: 'code', isComplete: true),
      toDo(id: '03', todoText: 'Sleep', ),
    ];
  }
}
