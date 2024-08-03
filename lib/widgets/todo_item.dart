import '../model/todo.dart';
import '../constants/color.dart';
import 'package:flutter/material.dart';

class Todo_item extends StatelessWidget {
  final ToDo toDo;
  final onTodoChanged;
  final onDeleteitem;

  const Todo_item({super.key, required this.toDo, this.onDeleteitem, this.onTodoChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTap: () {
          onTodoChanged(toDo);
          print("Clicked on todo item");
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(toDo.isDone?
          Icons.check_box:Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          toDo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: toDo.isDone?TextDecoration.lineThrough:null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(horizontal: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: tdPur,
          ),
          child: IconButton(
              onPressed: () {
                onDeleteitem(toDo.id);
                print("Clicked on  del");
              },
              icon: Icon(
                Icons.delete,
                size: 18,
              )),
        ),
      ),
    );
  }
}
