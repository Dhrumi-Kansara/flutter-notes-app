import 'package:flutter/material.dart';
import 'package:notes/api/google_sheets_api.dart';
import './text_box.dart';


class NotesGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: GoogleSheetsApi.currentNotes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return MyTextBox(text: GoogleSheetsApi.currentNotes[index]);
        });
  }
}