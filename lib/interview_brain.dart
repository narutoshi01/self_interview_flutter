import 'interview_question.dart';

class InterViewBrain {
  List<InterviewQuestion> _questionBox = [
    InterviewQuestion(
        questionText: '志望動機を教えてください', questionAnswer: '志望動機に対する返答'),
    InterviewQuestion(
        questionText: 'あなたの強みを教えてください', questionAnswer: '強みに対する返答'),
    InterviewQuestion(
        questionText: '将来の目標を教えてください', questionAnswer: '将来の目標に対する返答'),
  ];

  int _questionNumber = 0;

  String getQuestionText() {
    return _questionBox[_questionNumber].questionText;
  }

  String getQuestionAnswer() {
    return _questionBox[_questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBox.length - 1) {
      _questionNumber++;
    }
  }

  void prevQuestion() {
    if (_questionNumber != 0) {
      _questionNumber--;
    }
  }
}
