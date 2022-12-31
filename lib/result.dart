import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback restHandler;

  Result(this.resultScore, this.restHandler);

  String get resultPhrase {
    var resultTest = 'you did it!';
    if (resultScore <= 8) {
      resultTest = 'great work';
    } else if (resultScore <= 12) {
      resultTest = "pretty work";
    } else if (resultScore <= 16) {
      resultTest = 'you are strange';
    } else {
      resultTest = 'you are so bad';
    }
    return resultTest;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(onPressed: restHandler, child: Text('Restart quiz'))
      ],
    ));
  }
}
