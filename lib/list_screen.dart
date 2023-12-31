import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:flutter_todolist/create_screen.dart';
import 'package:flutter_todolist/todo.dart';
import 'package:flutter_todolist/todo_item.dart';

import 'main.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo 리스트'),
      ),
      body: ListView(
        children: todos.values
            .map((e) => TodoItem(
                  todo: e,
                  onTap: (todo) async{
                    todo.isDone = !todo.isDone;
                    await todo.save();
                    setState(() {

                    });
                  },
                  onDelete: (todo) async{
                    await todo.delete();
                    setState(() {

                    });
                  },
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateScreen(),
              ));
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
