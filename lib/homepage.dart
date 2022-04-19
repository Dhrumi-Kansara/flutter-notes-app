import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes/api/google_sheets_api.dart';
import 'package:notes/components/loading_circle.dart';
import './components/round_rectangle_btn.dart';
import './components/notes_grid.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    //implement initState
    super.initState();
    _noteController.addListener(() => setState(() {}));
  }

      void _post() {
      GoogleSheetsApi.insert(_noteController.text);
      _noteController.clear();
      setState(() {});
    }

    //wait for data to be fetched form google api
    void startLoading() {
      Timer.periodic(Duration(seconds: 1), (timer) {
        if (GoogleSheetsApi.loading == false) {
          setState(() {});
          timer.cancel();
        }
      });
    }

  @override
  Widget build(BuildContext context) {
    String text = "";

    if(GoogleSheetsApi.loading==true) {
      startLoading();
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'P O S T  A  N O T E',
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
                child: GoogleSheetsApi.loading == true
                    ? LoadingCircle()
                    : NotesGrid()),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _noteController,
                    decoration: InputDecoration(
                      hintText: "enter",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _noteController.clear();
                        },
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RoundRectangleBtn(
                      onTap: _post,
                      text: "P O S T",
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
