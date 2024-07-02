/*class QuizData {
  final String subjectName;
  final String topicName;
  final String assignDate;
  final String lastDate;
  final String status;

  QuizData(this.subjectName, this.topicName, this.assignDate, this.lastDate,
      this.status);
}

List<QuizData> assignment = [
  QuizData(
      'Biology', 'Red Blood Cells', '17 Nov 2021', '20 Nov 2021', 'Pending'),
  QuizData('Physics', 'bohr theory', '11 Nov 2021', '20 Nov 2021', 'Submitted'),
  QuizData('Chemistry', 'Organic Chemistry', '21 Oct 2021', '27 Oct 2021',
      'Not Submitted'),
  QuizData('Mathematics', 'Algebra', '17 Sep 2021', '30 Sep 2021', 'Pending'),
];*/

//import 'dart:html';

class Question {
  //question will have question Id
  final String id;
  //question title
  final String title;
  //question option
  final Map<String, bool> options;

  //create constructor
  Question({
    required this.id,
    required this.title,
    required this.options,
  });

  //override the toString method to print question on console
  @override
  String toString() {
    // TODO: implement toString
    return 'Question(id:$id, title:$title, options:$options)';
  }
}
