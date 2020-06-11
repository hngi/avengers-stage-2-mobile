class QuestionLogic {
  String questionText;
  String questionAnswer;

// For logic questions with one answer and no options
  QuestionLogic(String q, String a) {
    questionText = q;
    questionAnswer = a;
  }
}

class LifeQuestion {
  String questionText;
  List<String> options;
  String questionAnswer;

  LifeQuestion(String question, List<String> op) {
    questionText = question;
    options = op;
  }
}
