import 'models/iq_questions.dart';
import 'data.dart';

class Brainy {
    double _correctResponse = 0.0;
  double _wrongResponse = 0.0;
  int _questionNumber = 0;
  String response = "";
  int totalQuestions = 0;
  IQQuestionBank iqQuestionBank = IQQuestionBank();
  List<IQQuestion> _questionBank;
  Brainy(){
    _questionBank = iqQuestionBank.iqQuestions(7);
    totalQuestions = _questionBank.length;
    for(int i =0; i<_questionBank.length; i++){
      _questionBank[i].options.shuffle();
    }
  }  
  

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  List<String> getOptions() {
    
    return _questionBank[_questionNumber].options;
  }

  String getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
    _correctResponse =0;
    _wrongResponse =0;
  }

  int numberOfQuestions() {
    print(_questionBank.length);
    return totalQuestions = _questionBank.length;
  }

  int currentQuestion() {
    return _questionNumber;
  }

  void incrementScore(){
    _correctResponse++;
  }
   void decrementScore(){
    _wrongResponse++;
  }
  get correctResponse{
    return _correctResponse;
  }
  get wrongResponse{
    return _wrongResponse;
  }
}
