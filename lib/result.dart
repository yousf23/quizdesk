import 'package:flutter/material.dart';

import 'data/Result.dart';

class result extends StatelessWidget {




  //resulttext
  String get resulttt {
    String resulttt;

    if (resulScore >= 70) {
      resulttt = 'good result';
    } else {
      resulttt = 'bad result';
    }
    return resulttt;
  }

  //الفكشن لعمل reset
  final Function() q;

  final int resulScore;
  final List<Result> answersList ;//
  result(this.q, this.resulScore,this.answersList); //constructor

  @override
  Widget build(BuildContext context) {
    print(answersList);
    return Center(
      child: Column(
        children: [
          ...answersList.map((b) {
            String message =(b.isRight)? '${b.questionNumber} is Right' : '${b.questionNumber} is Wrong';
            Color color =(b.isRight)? Colors.green : Colors.red;//Ternary Operator
    return RaisedButton(
      onPressed:q,
      color: Colors.lightBlueAccent,
      textColor: color,
      child: Text(message),

    ); //كود لجلب الاجوبة من الماب
    }).toList(),
          Center(child: Text('$resulttt')),
          FlatButton(
              onPressed: q, child: Text('Try again ')), //ارجاع الاسلة الى الصفر
        ],
      ),
    );
  }
}
