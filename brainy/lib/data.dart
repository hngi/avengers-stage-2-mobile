import 'models/iq_questions.dart';


/*
Please Key note for the data
Please do not add explanation to the answer
  Use this format
Options ["", "", "", ""]

IQQuestion("Question Here",
      [Options],
      "Answer")
      
*/






/*
List<LifeQuestion> _logicQuestionBank = [
  LifeQuestion("Who do I spend time with?",
      ["Mentor", "Friends", "Family", "Neighbours"]),
  LifeQuestion("What are they doing to me?",
      ["Encourage my passion", "discourage my passion", "I don’t Know"]),
  LifeQuestion("What have they got me thinking?",
      ["Positive things", "Negative things", "Irrelevant things,"]),
  LifeQuestion("What have they got me talking?",
      ["about my dreams", "about their dreams", "nothing serious"]),
  LifeQuestion("Where have they got me going?", [
    "don’t Know",
    "towards my dreams / A promising Future",
    "towards their dreams"
  ])
];*/

List<IQQuestion> iqQuestionBank = [
  /*
  IQQuestion("I don't have eyes, nose, ears and tongue but I can see, hear and taste everything, what am I?", [""], "Brain"),
*/
  IQQuestion(
      "Find the answer that best completes the analogy: Book is to Reading as Fork is to: ",
      ["drawing", "writing", "stirring", "eating"],
      "stirring"),
  // This question has two correct answers.
  IQQuestion(
      "Which of the following can be arranged into a 5-letter English word? ",
      ["H R G S T", "R I L S A", "T O O M T", "W Q R G S"],
      "RILSA"),
  IQQuestion(
      "What number best completes the analogy: 8:4 as 10:",
      ["3", "7", "24", "5"],
      "5"),
  IQQuestion(
      "One rabbit saw 6 elephants while going towards River. Every elephant saw 2 monkeys going towards the river. Every monkey holds one tortoise in their hands. How many animals are going towards the river?",
      ["14", "11", "8", "5"],
      "5"),
  IQQuestion(
      "Look at this series: 12, 11, 13, 12, 14, 13, … What number should come next?",
      ["10", "16", "13", "15"],
      "15"),
  IQQuestion("Melt : Liquid :: Freeze : ", ["Ice", "Solid", "Condense", "Push"],
      "Solid"),

  IQQuestion(
      "Choose what number represents the Roman numeral: LXI ",
      ["51", "98", "61", "20"],
      "61"),

/*
  IQQuestion(
      "What is it that is greater than God, more Evil than the Devil, the Rich Wants it and the poor man have it ",
      ["No Option"],
      "Answer: Nothing. Nothing Evil than the Devil, The rich need nothing the poor have nothing."),
  IQQuestion(
      "Hom many times can you subtract 10 from 100? ",
      ["5 times ", "10 times", "1 times only", "100 times"],
      "Answer: C - The next times you will be subtracting from 90."),
  IQQuestion("Which number should come next in the pattern? 37, 34, 31, 28",
      ["No Option"], "Answer: 25, the numbers are decreasing by 3"),
  IQQuestion(
      "If you divide 30 by half and add ten, what do you get? ",
      ["No option on this"],
      "The answer is 70. Half is 0.5. If you divide 30 by 0.5, you get 60. Add ten and you have 70."),
  IQQuestion(
      "Which word does NOT belong with the others? ",
      ["index", "glossary", "chapter", "book"],
      "The answer is D. Book. Rest are all parts of a book."),
  IQQuestion("Pick the odd man out? ", ["just", "fair", "equitable", "biased"],
      "The answer is D. Biased. The others signify honesty."),
  IQQuestion("CUP : LIP :: BIRD : ?", ["GRASS", "FOREST", "BEAK", "BUSH"],
      "The answer is C. BEAK. You drink out of a cup with your lips. Similarly, birds bite grass with their beaks."),
  IQQuestion("Paw : Cat :: Hoof : ?", ["Lamb", "Horse", "Elephant", "Tiger"],
      "The answer is B. Horse. Cat’s feet are called paws and horse’s are called hoofs."),
  IQQuestion("Safe : Secure :: Protect :",
      ["Lock", "Guard", "Sure", "Conserve"], "The answer is B. Guard"),
  IQQuestion(
      "A person lived 3 days in the hospital and was absolutely fine. However he had to be carried out. How is that possible",
      ["No option for this"],
      "The answer is a newborn baby"),
  IQQuestion(
      "How can you lift an Elephant with one hand?",
      ["No option for this"],
      "Answer-It is not a problem since you will never find an Elephant with one hand."),
  IQQuestion(
      "One man was 25 years old in 2000 and 20 years old in 2005. How is that possible?",
      ["No option for this"],
      "The answer is the man lived BC"),
  IQQuestion("How do you convert your three matchsticks into number 6?",
      ["No option for this"], "The answer is by making a roman numeral VI."),
  IQQuestion("How can a man go 8 days without sleep? ", ["No option for this"],
      "The answer is by sleeping during the night time"),
  IQQuestion(
      "'Rhythm of eyes' city name in India? ",
      ["Chennai", "Nainital", "Srinagar", "Karnataka"],
      "The answer is Nainital. Explanation: 'Rhythm of eyes' logically means Nainital in India.The other cities are: No Zip - Chennai, Mr. City - Srinagar, Do Acting - Karnataka"),
   */
];
/*
7. Question: Why are 1968 pennies worth more than 1967 pennies?
Answer
Because there is one more penny in 1968 pennies than in 1967 pennies.
8. Questions: There are eight men sitting on a couch. Three legs break and six men leave. How many legs are remaining?
Answer
Five; the legs of the two remaining men (4) and the remaining couch leg.
9. Question: What is the maximum number of times a single page of a newspaper can be folded in half by hand?
Answer
Only once, because after that you will be folding it into quarters, eighths, etc.
10. Question: If you divide 30 by half and add ten, what do you get?
Answer
70. Half is .5. If you divide 30 by 0.5, you get 60. Add ten and you have 70.
11. Which word does NOT belong with the others?
A. index
B. glossary
C. chapter
D. book
Answer: D. Book. Rest are all parts of a book.
12. Pick the odd man out?
A. just
B. fair
C. equitable
D. biased
Answer: D. Biased. The others signify honesty.
13. CUP : LIP :: BIRD : ?
A. GRASS
B. FOREST
C. BEAK
D. BUSH
Answer: C. BEAK. You drink out of a cup with your lips. Similarly, birds bite grass with their beaks.
14. Paw : Cat :: Hoof : ?
A. Lamb
B. Horse
C. Elephant
D. Tiger
Answer: B. Horse. Cat’s feet are called paws and horse’s are called hoofs.
15. Safe : Secure :: Protect :
A. Lock
B. Guard
C. Sure
D. Conserve
Answer: B. Guard
16. Melt : Liquid :: Freeze :
A. Ice
B. Solid
C. Condense
D. Push
Answer: B. Solid
17. Choose what number represents the Roman numeral: LXI
51
98
61
20
Answer is C. L is 50, X is 10, I is 1. Hence, 50+10+1=61.
18. What is it that is greater than God?
more Evil than the Devil,
    the Rich Wants it and
the poor man have it
Ans. Nothing.
Nothing Evil than the Devil, The rich need nothing the poor have nothing.
19. Hom many times can you subtract 10 from 100?
a. 5 times
b. 10 times
c. 1 times only
b. 100 times
Answer is C - The next times you will be subtracting from 90.
20. Which number should come next in the pattern?
37, 34, 31, 28
Answer: 25, the numbers are decreasing by 3*/