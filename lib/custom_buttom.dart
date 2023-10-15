import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final void Function(String) onPressed;

  const CustomFloatingActionButton({super.key, required this.onPressed});

  void _addTodo(BuildContext context) async {
    final newTodo = await showDialog(
      context: context,
      builder: (context) {
        String description = '';
        return AlertDialog(
          backgroundColor: Colors.grey,
          title:  Text('Add Todo',style: GoogleFonts.cormorantGaramond(fontSize: 30,color: Colors.red,fontWeight: FontWeight.bold),),
          content: TextField(
            onChanged: (value) {
              description = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, null);
              },
              child: const Text('Cancel',style: TextStyle(color: Colors.black),),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, description);
              },
              child:  const Text('Add',style: TextStyle(color: Colors.red),),
            ),
          ],
        );
      },
    );

    if (newTodo != null && newTodo.trim().isNotEmpty) {
      onPressed(newTodo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.red,
      onPressed: () => _addTodo(context),
      child:  Icon(Icons.add,color: Colors.amber.shade600),
    );
  }
}