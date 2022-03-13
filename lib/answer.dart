import 'package:flutter/material.dart';

class answer extends StatelessWidget {
  final String answertext;
  final Function() x;

  answer(this.x, this.answertext);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        onPressed: null,
        color: Colors.lightBlueAccent,
        textColor: Colors.red,
        child: Text(answertext),
        onLongPress: x,
      ),
    );
  }
}
