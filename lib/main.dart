import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

import 'data/Result.dart';

main() => runApp(Myapp());

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  int _totalScore = 0;
  List<Result> answerList =[];
  int _questionIndex = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void answerquestion(int score,Map map ) {

    _totalScore += score;
    Result  result = Result(map['ísRight'] as bool,_questionIndex);
    answerList.insert(_questionIndex, result);
    //answerList[_questionIndex]= Result(map['ísRight'] as bool,_questionIndex);
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    print('bonton1111');
    print(_totalScore);
  }

  //Right now we are clacualting the scorein our app?
  //

  final List<Map<String, Object>> _question = [
    {
      'a': 'what the best color?',
      'b': [
        {'text': 'black', 'score': 10,'bool': true,'ísRight':true},
        {'text': 'yallow', 'score': 10,'bool': true,'ísRight':false},
        {'text': 'green', 'score': 10,'bool': true,'ísRight':false},
        {'text': 'orange', 'score': 10,'bool': true,'ísRight':false},
      ]
    },
    {
      'a': 'what the best car?',
      'b': [
        {'text': 'bmw', 'score': 10,'ísRight':false},
        {'text': 'mazda', 'score': 10,'ísRight':false},
        {'text': 'toyota', 'score': 10,'ísRight':true},
        {'text': 'dacia', 'score': 10,'ísRight':false},
      ]
    },
    {
      'a': 'what the best animal',
      'b': [
        {'text': 'rabbit', 'score': 10,'ísRight':false},
        {'text': 'tiger', 'score': 10,'ísRight':true},
        {'text': 'elephant', 'score': 10,'ísRight':false},
        {'text': 'lion', 'score': 10,'ísRight':false},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('heyy'),
        ),
        body: Container(
          //_questionIndex<_question.length?  // ida kan _questionIndex a9al min  question = Text('done'),
          child: _questionIndex < _question.length
              ? quiz.all(_question, answerquestion,
                  _questionIndex) //جلب من كلاس اخر باستعمال constructor
              : result(_resetQuiz,_totalScore,answerList), //text رسالة النهاية
        ),
      ),
    );
  }
}
