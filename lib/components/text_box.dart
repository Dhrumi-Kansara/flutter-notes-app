import 'package:flutter/material.dart';
import '../utils/constant.dart';
import 'dart:math';

class MyTextBox extends StatelessWidget {

  final String text;
  MyTextBox({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container( 
          color: kNotesColors[Random().nextInt(kNotesColors.length)],
          padding: EdgeInsets.all(10),
          child: Center(child: Text(text),),
        ),
      ),
    );
  }

}