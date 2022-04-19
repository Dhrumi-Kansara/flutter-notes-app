import 'dart:async';

import 'package:gsheets/gsheets.dart';
import './config.dart';

class GoogleSheetsApi {

  //create crededentials
  static String _credentials = credentials;

  // spredsheet id
  String? _spreadsheetId = spreadsheatid; 

  //init Gsheets
  final gsheets = GSheets(_credentials); 
  static Worksheet? _worksheet;

  //keep track of
  static int numberOfNotes=0;
  static List<String> currentNotes=[];
  static bool loading = true;

  Future init() async {
    //  fetch spreadsheet by its id
    final ss = await gsheets.spreadsheet(_spreadsheetId!);
    _worksheet = ss.worksheetByTitle('Notes');

    loadNotes();

  }

  static Future loadNotes() async {
    //load and add notes to array
    List<List<String>> notes = await _worksheet!.values.allRows(fromColumn: 1, fromRow: 1);  
    for(int i=0;i<notes.length;i++) {  
      currentNotes.add(notes[i][0]);
    } 

    loading=false;

    print("loading: ${loading}");
  }

  static Future insert(String note) async{
    if(_worksheet==null) return;
    numberOfNotes++;
    currentNotes.add(note);
    await _worksheet!.values.appendRow([note], fromColumn: 1); 
  }


}

