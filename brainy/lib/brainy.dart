import 'models/iq_questions.dart';
import 'data.dart';

class Brainy {
    double _correctResponse = 0.0;
  double _wrongResponse = 0.0;
  int _questionNumber = 0;
  String response = "";
  int totalQuestions = 0;
  double _totalScore = 150.0;
  final String username;
  
  IQQuestionBank iqQuestionBank = IQQuestionBank();
  List<IQQuestion> _questionBank;
  Brainy({this.username}){
    _questionBank = iqQuestionBank.iqQuestions(10);
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
    return totalQuestions = _questionBank.length;
  }

  int currentQuestion() {
    return _questionNumber;
  }

  void incrementScore(){
    _correctResponse+=15;
  }
   void decrementScore(){
    _wrongResponse+=15;
  }
  get correctResponse{
    return _correctResponse;
  }
  get wrongResponse{
    return _wrongResponse;
  }
  get totalScore{
    return _totalScore;
  }
  get player{
    return username;
  }
}

