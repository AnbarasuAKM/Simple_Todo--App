import 'package:flutter/material.dart';

class ToDo{
  String? id;
  String? todoText;
  bool isDone;
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
});
  static List<ToDo>todoList(){
    return[
      ToDo(id: "01", todoText: "We have one meeting",isDone: true),
      ToDo(id: "02", todoText: "Go for an vacation",isDone: true),
      ToDo(id: "03", todoText: "Movie",isDone: false),
      ToDo(id: "04", todoText: "Demo session-TODOs ..",),
    ];
  }
}