import '../constants/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/todo.dart';
import '../widgets/todo_item.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final todosList = ToDo.todoList();

  final todoController = TextEditingController();

  List<ToDo> _foundtodo = [];

  @override
  void initState() {
    _foundtodo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdPur,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40, bottom: 20),
                        child: Text(
                          "ToDos...!!",
                          style: TextStyle(fontFamily: "assets/fonts/Montserrat-Light.ttf",
                              fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                      ),
                      for (ToDo todooo in _foundtodo.reversed
                      )
                        Todo_item(
                          toDo: todooo,
                          onTodoChanged: _handleTodoChange,
                          onDeleteitem: _deleteTodoitem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 04),
                  margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 04.0,
                        spreadRadius: 0.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: todoController,
                    decoration: InputDecoration(
                        hintText: "Type Here.....!!",
                        hintStyle: TextStyle(fontFamily: "assets/fonts/Montserrat-Bold.ttf"), border: InputBorder.none),
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _addTodoitem(todoController.text);
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.purple.shade500,
                      size: 26,
                    ),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.red,
                        backgroundColor: Colors.white,
                        minimumSize: Size(50, 50),
                        elevation: 10),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleTodoChange(ToDo toDo) {
    setState(() {
      toDo.isDone = !toDo.isDone;
    });
  }

  void _deleteTodoitem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addTodoitem(String toDo) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    todoController.clear();
  }

  void _runFiltertoDo(String enterdKeyword) {
    List<ToDo> results = [];
    if (enterdKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enterdKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundtodo=results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: TextField(
        onChanged: (value){_runFiltertoDo(value);},
        decoration: InputDecoration(
          hintText: "Search Here",
          hintStyle: TextStyle(fontFamily: "assets/fonts/Montserrat-Medium.ttf"),
          contentPadding: EdgeInsets.all(17),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(minHeight: 25, minWidth: 35),
          border: InputBorder.none,
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: tdPur,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Drawer();
            },
            icon: Icon(
              Icons.menu,
              size: 30,
            ),
            color: tdBlack,
          ),
          Container(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset("assets/images/onboardingone.png"),
            ),
          ),
        ],
      ),
    );
  }
}
