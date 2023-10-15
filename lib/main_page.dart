import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mytodoapp/todo_list_tile.dart';
import 'package:mytodoapp/todo_model.dart';

import 'custom_buttom.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _todoBox = Hive.box<TodoModel>('todos');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        centerTitle: true,
        title:  RichText(
          text:  TextSpan(
            children: [
              TextSpan(
                text: 'To ',
                 style: GoogleFonts.abrilFatface(
                  color: Colors.black,
                   fontSize: 40,
                 ),),
              TextSpan(
                text: '-Dos',
                style: GoogleFonts.abrilFatface(
                  color: Colors.red,
                  fontSize: 40,
              ),

          ),
          ]
        ),
      ),
    ),
      body: ValueListenableBuilder(
          valueListenable: _todoBox.listenable(),
          builder: (context, Box<TodoModel>box, _) {
            if (box.length != 0) {
              return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final todo = box.getAt(index)!;
                    return TodoListTile(
                      todo: todo,
                      index: index,
                      onDelete: _deleteTodo,
                    );
                  });
            } else {
              return  Center(
                child: Text(
                    "Press the \"+\" button at the bottom right to add todo.",style: GoogleFonts.cormorantGaramond(
                  fontSize: 23,
                  color:  Colors.black,
                )),
              );
            }
          }),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: _addTodo,
      ),
    );
  }

  void _addTodo(String description) {
    final todo = TodoModel(Description: description);
    _todoBox.add(todo);
  }



  void _deleteTodo(int index) {
    _todoBox.deleteAt(index);
  }
}
