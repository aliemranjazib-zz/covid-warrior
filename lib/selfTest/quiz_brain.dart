import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('Body Pain or headache?', true),
    Question('Did you feel Fever?', true),
    Question('Check you fever level say yes if it is more than 101', true),
    Question('Did you lose your you smell?', true),
    Question('Did you feel tired?', true),
    Question('Rash on skin or discoloration of fingers or toe.', true),
    Question('Did you feel shortness of breath?', true),
    Question('Are you suffered from dry cough?', true),
    Question('Did you feel chest pain or pressure?', true),
    Question('Did you feel to loss of speech or movement?', true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber == _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  int reset() {
    return _questionNumber = 0;
  }
}
