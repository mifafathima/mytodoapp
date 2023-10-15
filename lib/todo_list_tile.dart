import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mytodoapp/todo_model.dart';

import 'delete_dialog.dart';

class TodoListTile extends StatelessWidget {
  final TodoModel todo;
  final int index;
  final Function(int) onDelete;

  const TodoListTile({super.key,
    required this.todo,
    required this.index,
    required this.onDelete});


  void _showDeleteConfirmationDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return DeleteConfirmationDialog(
          onCancel: () {
            Navigator.of(context).pop();
          },
          onDelete: () {
            onDelete(index);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        //tileColor: Colors.red.shade400,
        title: Text(todo.Description,
          style: TextStyle(decoration: todo.isDone
              ? TextDecoration.lineThrough
              : TextDecoration.none,

          ),
        ),
        leading: Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: todo.isDone ? Colors.red : Colors.grey,
                width: 2,
              )
          ),
          child: Center(
              child: todo.isDone
                  ? Icon(Icons.check,
                  size: 16, color: Theme.of(context).primaryColor)
                  : null
          ),
        ),
        onTap: () {
          final newTodo = TodoModel(
            Description: todo.Description,
            isDone: !todo.isDone,
          );
          Hive.box<TodoModel>('todos').putAt(index, newTodo);
        },
        //tile long press delete
        onLongPress: () {
          _showDeleteConfirmationDialog(context);
        },
        trailing: IconButton(
          icon: const Icon(Icons.delete,color: Colors.red,),
          onPressed: () => _showDeleteConfirmationDialog(
              context),
        ),
      ),


    );
  }
}

