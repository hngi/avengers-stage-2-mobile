
class IQQuestion {
  String questionText;
  List<String> options;
  String questionAnswer;

  // For math, english and questions with four options
  IQQuestion(String q, List<String> op, String answer) {
    questionText = q;
    options = op;
    questionAnswer = answer;
  }
}