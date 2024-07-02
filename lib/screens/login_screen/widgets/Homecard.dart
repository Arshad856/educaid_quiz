import 'package:brain_school/constants.dart';
import 'package:brain_school/screens/assignment_screen/assignment_screen.dart';
import 'package:brain_school/screens/datesheet_screen/datesheet_screen.dart';
import 'package:brain_school/screens/login_screen/upload_quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

String? selectedTermValue; // Maintain the selected value
String? selectedSubjectValue;
String? selectedGradeValue;
bool? selectedAnswere1Value;
bool? selectedAnswere2Value;
bool? selectedAnswere3Value;
bool? selectedAnswere4Value;

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 1.h),
        width: 347.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(109.0),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 0, 0, 0),
                spreadRadius: 5,
                blurRadius: 5,
                blurStyle: BlurStyle.solid),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /*ImageIcon(
              AssetImage(icon),
              size: 30.sp, // Optional: Adjust icon size
              // Optional: Apply color tint
            ),*/
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: kBlackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Timmana'),
            ),
          ],
        ),
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  //String? selectedValue; // Maintain the selected value

  final List<String> items = ['Grade 10', 'Grade 11'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 347.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: kTextWhiteColor,
                borderRadius: BorderRadius.circular(109.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0),
                    spreadRadius: 5,
                    blurRadius: 8,
                    blurStyle: BlurStyle.solid,
                  ),
                ],
              ),
            ),
            // DropdownButton widget
            Positioned(
              top: 0,
              child: DropdownButton<String>(
                value: selectedGradeValue, // Use the selected value
                style: TextStyle(color: kBlackColor),
                onChanged: (String? newValue) {
                  setState(() {
                    // Update the selected value when an item is selected
                    selectedGradeValue = newValue;
                  });
                  print('Selected: $newValue');
                },
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.0),
      ],
    );
  }
}

class SubjectDropDown extends StatefulWidget {
  @override
  _SubjectDropDownState createState() => _SubjectDropDownState();
}

class _SubjectDropDownState extends State<SubjectDropDown> {
  //String? selectedValue; // Maintain the selected value

  final List<String> items = ['Mathematics', 'Science'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 347.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: kTextWhiteColor,
                borderRadius: BorderRadius.circular(109.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0),
                    spreadRadius: 5,
                    blurRadius: 8,
                    blurStyle: BlurStyle.solid,
                  ),
                ],
              ),
            ),
            // DropdownButton widget
            Positioned(
              top: 0,
              child: DropdownButton<String>(
                value: selectedSubjectValue, // Use the selected value
                style: TextStyle(color: kBlackColor),
                onChanged: (String? newValue) {
                  setState(() {
                    // Update the selected value when an item is selected
                    selectedSubjectValue = newValue;
                  });
                  print('Selected: $newValue');
                },
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.0),
      ],
    );
  }
}

class TermDropDown extends StatefulWidget {
  @override
  _TermDropDownState createState() => _TermDropDownState();
}

class _TermDropDownState extends State<TermDropDown> {
  //String? selectedValue; // Maintain the selected value

  final List<String> items = ['1st term', '2nd term', '3rd term'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 347.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: kTextWhiteColor,
                borderRadius: BorderRadius.circular(109.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0),
                    spreadRadius: 5,
                    blurRadius: 8,
                    blurStyle: BlurStyle.solid,
                  ),
                ],
              ),
            ),
            // DropdownButton widget
            Positioned(
              top: 0,
              child: DropdownButton<String>(
                value: selectedTermValue, // Use the selected value
                style: TextStyle(color: kBlackColor),
                onChanged: (String? newValue) {
                  setState(() {
                    // Update the selected value when an item is selected
                    selectedTermValue = newValue;
                  });
                  print('Selected: $newValue');
                },
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.0),
      ],
    );
  }
}

class AnswerDropDown1 extends StatefulWidget {
  @override
  _AnswerDropDownState createState() => _AnswerDropDownState();
}

class _AnswerDropDownState extends State<AnswerDropDown1> {
  //String? selectedValue; // Maintain the selected value

  final List<bool> items = [true, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 347.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: kTextWhiteColor,
                borderRadius: BorderRadius.circular(109.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0),
                    spreadRadius: 5,
                    blurRadius: 8,
                    blurStyle: BlurStyle.solid,
                  ),
                ],
              ),
            ),
            // DropdownButton widget
            Positioned(
              top: 0,
              child: DropdownButton<bool>(
                value: selectedAnswere1Value, // Use the selected value
                style: TextStyle(color: kBlackColor),
                onChanged: (bool? newValue) {
                  setState(() {
                    // Update the selected value when an item is selected
                    selectedAnswere1Value = newValue;
                  });
                  print('Selected: $newValue');
                },
                items: items.map((bool item) {
                  return DropdownMenuItem<bool>(
                    value: item,
                    child: Text(item.toString()),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.0),
      ],
    );
  }
}

class AnswerDropDown2 extends StatefulWidget {
  @override
  _AnswerDropDownState2 createState() => _AnswerDropDownState2();
}

class _AnswerDropDownState2 extends State<AnswerDropDown2> {
  //String? selectedValue; // Maintain the selected value

  final List<bool> items = [true, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 347.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: kTextWhiteColor,
                borderRadius: BorderRadius.circular(109.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0),
                    spreadRadius: 5,
                    blurRadius: 8,
                    blurStyle: BlurStyle.solid,
                  ),
                ],
              ),
            ),
            // DropdownButton widget
            Positioned(
              top: 0,
              child: DropdownButton<bool>(
                value: selectedAnswere2Value, // Use the selected value
                style: TextStyle(color: kBlackColor),
                onChanged: (bool? newValue) {
                  setState(() {
                    // Update the selected value when an item is selected
                    selectedAnswere2Value = newValue;
                  });
                  print('Selected: $newValue');
                },
                items: items.map((bool item) {
                  return DropdownMenuItem<bool>(
                    value: item,
                    child: Text(item.toString()),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.0),
      ],
    );
  }
}

class AnswerDropDown3 extends StatefulWidget {
  @override
  _AnswerDropDownState3 createState() => _AnswerDropDownState3();
}

class _AnswerDropDownState3 extends State<AnswerDropDown3> {
  //String? selectedValue; // Maintain the selected value

  final List<bool> items = [true, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 347.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: kTextWhiteColor,
                borderRadius: BorderRadius.circular(109.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0),
                    spreadRadius: 5,
                    blurRadius: 8,
                    blurStyle: BlurStyle.solid,
                  ),
                ],
              ),
            ),
            // DropdownButton widget
            Positioned(
              top: 0,
              child: DropdownButton<bool>(
                value: selectedAnswere3Value, // Use the selected value
                style: TextStyle(color: kBlackColor),
                onChanged: (bool? newValue) {
                  setState(() {
                    // Update the selected value when an item is selected
                    selectedAnswere3Value = newValue;
                  });
                  print('Selected: $newValue');
                },
                items: items.map((bool item) {
                  return DropdownMenuItem<bool>(
                    value: item,
                    child: Text(item.toString()),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.0),
      ],
    );
  }
}

class AnswerDropDown4 extends StatefulWidget {
  @override
  _AnswerDropDownState4 createState() => _AnswerDropDownState4();
}

class _AnswerDropDownState4 extends State<AnswerDropDown4> {
  //String? selectedValue; // Maintain the selected value

  final List<bool> items = [true, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 347.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: kTextWhiteColor,
                borderRadius: BorderRadius.circular(109.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0),
                    spreadRadius: 5,
                    blurRadius: 8,
                    blurStyle: BlurStyle.solid,
                  ),
                ],
              ),
            ),
            // DropdownButton widget
            Positioned(
              top: 0,
              child: DropdownButton<bool>(
                value: selectedAnswere4Value, // Use the selected value
                style: TextStyle(color: kBlackColor),
                onChanged: (bool? newValue) {
                  setState(() {
                    // Update the selected value when an item is selected
                    selectedAnswere4Value = newValue;
                  });
                  print('Selected: $newValue');
                },
                items: items.map((bool item) {
                  return DropdownMenuItem<bool>(
                    value: item,
                    child: Text(item.toString()),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.0),
      ],
    );
  }
}

class end_buttons extends StatelessWidget {
  const end_buttons({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 1.h),
        width: 205.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(109.0),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 0, 0, 0),
                spreadRadius: 8,
                blurRadius: 8,
                blurStyle: BlurStyle.solid),
          ],
        ),
        child: MaterialButton(
          onPressed: () {
            print('question type selected');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => UploadScreen(
                          selectedGradeValue: selectedGradeValue,
                          selectedSubjectValue: selectedSubjectValue,
                          selectedTermValue: selectedTermValue,
                        ))));
            // Handle right button action
          },
          child: Text(
            title,
            style: TextStyle(
              color: kBlackColor,
              fontWeight: FontWeight.w600,
              fontSize: 28,
              fontStyle: FontStyle.italic,
              fontFamily: 'Timmana',
            ),
          ),
        ),
      ),
    );
  }
}

class Answerupload_buttons extends StatelessWidget {
  const Answerupload_buttons(
      {Key? key,
      required this.title,
      required this.Questionid,
      required this.Question,
      required this.Option1,
      required this.Option2,
      required this.Option3,
      required this.Option4,
      required this.Grade,
      required this.Subject,
      required this.Term})
      : super(key: key);
  final String title;
  final String? Questionid;
  final String? Question;
  final String? Option1;
  final String? Option2;
  final String? Option3;
  final String? Option4;
  final String? Grade;
  final String? Subject;
  final String? Term;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 1.h),
        width: 205.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(109.0),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 0, 0, 0),
                spreadRadius: 8,
                blurRadius: 8,
                blurStyle: BlurStyle.solid),
          ],
        ),
        child: MaterialButton(
          onPressed: () {
            // Handle right button action
            //upload to database
            print('uploading');
            print(Grade.toString());
            print(Subject.toString());
            print(Term.toString());
            print(Questionid);
            print(Question);
            print(Option1);
            print(selectedAnswere1Value);
            print(Option2);
            print(selectedAnswere2Value);
            print(Option3);
            print(selectedAnswere3Value);
            print(Option4);
            print(selectedAnswere4Value);
            postData();
          },
          child: Text(
            title,
            style: TextStyle(
              color: kBlackColor,
              fontWeight: FontWeight.w600,
              fontSize: 28,
              fontStyle: FontStyle.italic,
              fontFamily: 'Timmana',
            ),
          ),
        ),
      ),
    );
  }

  Future<void> postData() async {
    final String url =
        'https://school-app-74a46-default-rtdb.firebaseio.com/questions/$Grade/$Subject/$Term/$Questionid.json';

    // Sample data to post
    final Map<String, dynamic> newData = {
      'options': {
        Option1: selectedAnswere1Value,
        Option2: selectedAnswere2Value,
        Option3: selectedAnswere3Value,
        Option4: selectedAnswere4Value
      },
      'title': Question

      // Add more terms or questions as needed

      // Add more subjects as needed

      // Add more grades as needed
    };

    try {
      final response = await http.put(
        Uri.parse(url),
        body: json.encode(newData),
      );

      if (response.statusCode == 200) {
        print('Data added successfully!');
      } else {
        print('Failed to add data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error posting data: $error');
      // Handle any errors that occur during the POST request
    }
  }
}
