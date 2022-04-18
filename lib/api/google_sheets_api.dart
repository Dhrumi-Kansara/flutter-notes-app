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

  Future init() async {
    //  fetch spreadsheet by its id
    final ss = await gsheets.spreadsheet(_spreadsheetId!);
    _worksheet = ss.worksheetByTitle('Notes');
  }

 
}