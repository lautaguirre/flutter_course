import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answer': [
        { 'text': 'Black', 'score': 10 },
        { 'text': 'Red', 'score': 5 },
        { 'text': 'Green', 'score': 3 },
        { 'text': 'White', 'score': 7 }
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answer': [
        { 'text': 'Rabbit', 'score': 4 },
        { 'text': 'Snake', 'score': 8 },
        { 'text': 'Elephant', 'score': 9 },
        { 'text': 'Lion', 'score': 1 }
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answer': [
        { 'text': 'Max', 'score': 0 },
        { 'text': 'Max', 'score': 2 },
        { 'text': 'Max', 'score': 6 },
        { 'text': 'Max', 'score': 10 }
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
