import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final void Function() onCancel;
  final void Function() onDelete;

  const DeleteConfirmationDialog({
    super.key,
    required this.onCancel,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Confirm Deletion",style: GoogleFonts.cormorantGaramond(fontSize: 30,color: Colors.red,fontWeight: FontWeight.bold),),
      content: Text("Are you sure you want to delete this task??"),
      actions: [
        TextButton(onPressed: onCancel, child: Text("Cancel",style: TextStyle(color: Colors.black),)),
        TextButton(onPressed: onDelete, child: Text("Delete",style: TextStyle(color: Colors.red),)
        )
      ],
    );
  }
}
