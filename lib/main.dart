import 'package:flutter/material.dart';
import 'package:hugger/result.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what is this color',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'red', 'score': 5},
        {'text': 'green', 'score': 8},
        {'text': 'purpule', 'score': 6}
      ]
    },
    {
      'questionText': 'what is this animal',
      'answers': [
        {'text': 'rabbit', 'score': 2},
        {'text': 'turkey', 'score': 7},
        {'text': 'owl', 'score': 6},
        {'text': 'bird', 'score': 10}
      ]
    },
    {
      'questionText': 'what is this ball',
      'answers': [
        {'text': 'gold', 'score': 6},
        {'text': 'pink', 'score': 8},
        {'text': 'gant', 'score': 4},
        {'text': 'nap', 'score': 2}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
    _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('My first App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
