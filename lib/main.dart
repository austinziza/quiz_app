import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
// main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color ?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal ?',
      'answers': [
        {'text': 'Bunny', 'score': 10},
        {'text': 'Panda', 'score': 5},
        {'text': 'Dingo', 'score': 3},
        {'text': 'Lion', 'score': 1}
      ],
    },
    {
      'questionText': 'Who\'s your favorite football player ?',
      'answers': [
        {'text': 'Lionel Messi', 'score': 10},
        {'text': 'Christiano Ronaldo', 'score': 5},
        {'text': 'Zlatan Ibrahimovic', 'score': 3},
        {'text': 'Neymar Jr', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite Movie ?',
      'answers': [
        {'text': 'Titanic', 'score': 10},
        {'text': 'Man on the moon', 'score': 5},
        {'text': 'The black Knight', 'score': 3},
        {'text': 'Just like heaven', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite instructor ?',
      'answers': [
        {'text': 'Anthony', 'score': 10},
        {'text': 'Calistus', 'score': 5},
        {'text': 'Jude', 'score': 3},
        {'text': 'Austin', 'score': 1}
      ],
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

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('we have more questions');
    } else {
      print('no more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
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
