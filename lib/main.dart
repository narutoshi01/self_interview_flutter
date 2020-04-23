import 'package:flutter/material.dart';
import 'interview_brain.dart';

InterViewBrain interViewBrain = InterViewBrain();

void main() => runApp(SelfInterview());

class SelfInterview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('セルフ面接'),
          backgroundColor: Colors.grey.shade900,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: InterviewPage(),
        ),
      ),
    );
  }
}

class InterviewPage extends StatefulWidget {
  @override
  _InterviewPageState createState() => _InterviewPageState();
}

class _InterviewPageState extends State<InterviewPage> {
  bool isAnswerVisible = false;

  String showAnswerText = '解答を見る';

  void initAnswerState() {
    isAnswerVisible = false;
    showAnswerText = '解答を見る';
  }

  void toggleAnswer() {
    if (isAnswerVisible) {
      isAnswerVisible = false;
      showAnswerText = '解答を見る';
    } else {
      isAnswerVisible = true;
      showAnswerText = 'もう一度';
      // 将来的には，’もう一度’ボタンを押すと，質問がもう一度再生されるようにしたい
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Center(
            child: Text(interViewBrain.getQuestionText()),
          ),
        ),
        Expanded(
          flex: 5,
          child: Center(
            child: Visibility(
                visible: isAnswerVisible,
                child: Text(interViewBrain.getQuestionAnswer())),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Visibility(
                visible: interViewBrain.isPrevBtnVisible(),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    // 戻るボタンクリック
                    setState(() {
                      interViewBrain.prevQuestion();
                      initAnswerState();
                    });
                  },
                ),
              ),
              FlatButton(
                child: Text(showAnswerText),
                onPressed: () {
                  //条件分岐　解答を表示，または，解答を隠す（もう一度）
                  setState(() {
                    toggleAnswer();
                  });
                },
              ),
              Visibility(
                visible: interViewBrain.isNextBtnVisible(),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    // 進むボタンクリック
                    setState(() {
                      interViewBrain.nextQuestion();
                      initAnswerState();
                    });
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
