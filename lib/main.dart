import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gsheets/gsheets.dart';
import 'dart:convert';
import './config.dart';

void main() async  {

  //load .env
  await dotenv.load(fileName: ".env");

  //create crededentials
  String _credentials = credentials;

  // spredsheet id
  String? _spreadsheetId = dotenv.env['SPREADSHEET_ID']; 

  //init Gsheets
  final gsheets = GSheets(_credentials);

  //fetch spreadsheet by its id
  final ss = await gsheets.spreadsheet(_spreadsheetId!);

  //get worksheet by its title
  var sheet = ss.worksheetByTitle('Notes');

  //update a cell
  await sheet!.values.insertValue('Raman', column: 1, row: 5);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}

