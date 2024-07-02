import 'package:brain_school/screens/quiz_screen/data/quiz_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:brain_school/screens/quiz_screen/quiz_app_screen.dart';

class DBconnect {
  final url = Uri.parse(
      'https://school-app-74a46-default-rtdb.firebaseio.com/questions.json');
  //fetch the data from database
  Future<List<Question>> fatchQuestions() async {
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];
      data.forEach((grade, gradeData) {
        print('grade key:' + grade);

        if (gradeData != null && gradeData is Map) {
          gradeData.forEach((subject, subjectData) {
            if (subjectData != null && subjectData is Map) {
              print('subjcts in that grade:' + subject);
              subjectData.forEach((term, termData) {
                if (termData != null && termData is Map) {
                  termData.forEach((questionKey, questionData) {
                    if (questionData != null &&
                        questionData is Map &&
                        questionData.containsKey('title') &&
                        questionData['options'] != null) {
                      var newQuestion = Question(
                        id: questionKey,
                        title: questionData['title'] ?? '',
                        options: Map.castFrom(questionData['options']),
                      );
                      newQuestions.add(newQuestion);
                      print(questionData['options']);
                    }
                  });
                }
              });
            }
          });
        }
      });
      print(newQuestions);

      return newQuestions;
      //print(newQuestions);
      //print(newQuestions.map((question) => question.title).toList());
      //print(newQuestions.map((question) => question.id).toList());
      //print(newQuestions.map((question) => question.options).toList());
    });
  }

  Future<List<Question>> fatchselectedQuestions(
      String Gradekey, String Subjectkey, String Termkey) async {
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];
      data.forEach((grade, gradeData) {
        //print('grade key:' + grade);
        if (grade == Gradekey) {
          print('grade key:' + grade);
          if (gradeData != null && gradeData is Map) {
            gradeData.forEach((subject, subjectData) {
              if (subject == Subjectkey) {
                if (subjectData != null && subjectData is Map) {
                  print('subjcts in that grade:' + subject);
                  subjectData.forEach((term, termData) {
                    if (term == Termkey) {
                      print('term:' + term);
                      if (termData != null && termData is Map) {
                        termData.forEach((questionKey, questionData) {
                          if (questionData != null &&
                              questionData is Map &&
                              questionData.containsKey('title') &&
                              questionData['options'] != null) {
                            var newQuestion = Question(
                              id: questionKey,
                              title: questionData['title'] ?? '',
                              options: Map.castFrom(questionData['options']),
                            );
                            newQuestions.add(newQuestion);
                            print(questionData['options']);
                          }
                        });
                      }
                    }
                  });
                }
              }
            });
          }
        }
      });
      print(newQuestions);
      print(newQuestions.map((question) => question.options).toList());
      return newQuestions;
      //print(newQuestions);
      //print(newQuestions.map((question) => question.title).toList());
      //print(newQuestions.map((question) => question.id).toList());
      //print(newQuestions.map((question) => question.options).toList());
    });
  }
}
