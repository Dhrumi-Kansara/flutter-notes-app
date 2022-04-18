import 'package:flutter/material.dart';
import './components/round_rectangle_btn.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {

    final TextEditingController _noteController = TextEditingController();

    void _post() {
      print('_________________');
      print(_noteController.text);
    }
 
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[700],
            ),
          ),
          Container(
            child: Column(
              children: [
                TextField(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RoundRectangleBtn(onTap: (){
                      print("->>>>>>>>>>>>>>post");
                    }, text: "P O S T",),
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

