import 'package:brain_school/constants.dart';
import 'package:brain_school/screens/assignment_screen/assignment_screen.dart';
import 'package:brain_school/screens/datesheet_screen/datesheet_screen.dart';
import 'package:brain_school/screens/login_screen/widgets/Homecard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

String? Questionid;
String? Question;
String? Option1;
String? Option2;
String? Option3;
String? Option4;

class UploadScreen extends StatefulWidget {
  const UploadScreen(
      {Key? key,
      required this.selectedGradeValue,
      required this.selectedSubjectValue,
      required this.selectedTermValue})
      : super(key: key);
  final String? selectedTermValue; // Maintain the selected value
  final String? selectedSubjectValue;
  final String? selectedGradeValue;
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  Widget _buildBottom() {
    return Container(
      color: kPrimaryColor,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.2),
                spreadRadius: 0,
                blurRadius: 10,
              ),
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
              backgroundColor: kPrimaryColor, // Set background color
              //selectedItemColor: kOtherColor, // Set color for selected items

              unselectedItemColor:
                  kBlackColor, // Set color for unselected items
              selectedIconTheme: IconThemeData(
                  color: kOtherColor), // Set color for selected icons
              unselectedIconTheme: IconThemeData(color: kBlackColor),
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      'assets/icons/home.svg'), // Replace with your SVG path
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      'assets/icons/quiz.svg'), // Replace with your SVG path
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      'assets/icons/clipboard-svgrepo-com.svg'), // Replace with your SVG path
                  label: '',
                ),
              ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: _buildBottom(),
      backgroundColor: Colors.orange,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover, // Adjust image fit as needed
          ),
        ),
        child: Column(
          children: [
            //we will divide the screen into two parts
            //fixed height for first half

            // First small rectangle (positioned at the top left)

            //other will use all the remaining height of screen
            Container(
              width: 100.w,
              height: 25.h,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      child: Container(
                          width: 100.w,
                          height: 185,
                          padding: EdgeInsets.all(kDefaultPadding),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(48),
                                bottomLeft: Radius.circular(48)),
                            color: kPrimaryColor,
                          ),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [],
                            )
                          ])),
                    ),
                  ),
                  Positioned(
                      top: 110,
                      child: Text(
                        'Upload Question',
                        style: TextStyle(
                          color: kTextWhiteColor,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          fontSize: 47,
                          fontFamily: 'Timmana',
                        ),
                      ))
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: kTopBorderRadius,
                ),
                child: SingleChildScrollView(
                  //for padding
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceEvenly, // Align buttons to opposite ends
                        children: [
                          buildQuestionidField('Question id Eg: Q1'),
                          sizedBox,
                          buildQuestionField('Enter the Question'),
                          sizedBox,
                          buildOption1Field('Option 1'),
                          AnswerDropDown1(),
                          sizedBox,
                          buildOption2Field('Option 2'),
                          AnswerDropDown2(),
                          sizedBox,
                          buildOption3Field('Option 3'),
                          AnswerDropDown3(),
                          sizedBox,
                          buildOption4Field('Option 4'),
                          AnswerDropDown4(),
                          sizedBox,
                          Answerupload_buttons(
                            title: 'Upload',
                            Questionid: Questionid,
                            Question: Question,
                            Option1: Option1,
                            Option2: Option2,
                            Option3: Option3,
                            Option4: Option4,
                            Grade: selectedGradeValue,
                            Subject: selectedSubjectValue,
                            Term: selectedTermValue,
                          ),
                          /*Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildNameField('Option 1'),
                              //sAnswerDropDown(),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildNameField('Option 2'),
                              AnswerDropDown(),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildNameField('Option 3'),
                              AnswerDropDown(),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildNameField('Option 4'),
                              AnswerDropDown(),
                            ],
                          ),
                          Answerupload_buttons(title: 'Select'),*/
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildQuestionidField(String label) {
    return TextFormField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.name,
      style: wInputTextStyle,
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onChanged: (value) {
        setState(() {
          Questionid = value;
        });
      },
      validator: (value) {
        //for validation
        RegExp regExp = new RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
          //if it does not matches the pattern, like
          //it not contains @
        }
      },
    );
  }

  TextFormField buildQuestionField(String label) {
    return TextFormField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.name,
      style: wInputTextStyle,
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onChanged: (value) {
        setState(() {
          Question = value;
        });
      },
      validator: (value) {
        //for validation
        RegExp regExp = new RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
          //if it does not matches the pattern, like
          //it not contains @
        }
      },
    );
  }

  TextFormField buildOption1Field(String label) {
    return TextFormField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.name,
      style: wInputTextStyle,
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onChanged: (value) {
        setState(() {
          Option1 = value;
        });
      },
      validator: (value) {
        //for validation
        RegExp regExp = new RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
          //if it does not matches the pattern, like
          //it not contains @
        }
      },
    );
  }

  TextFormField buildOption2Field(String label) {
    return TextFormField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.name,
      style: wInputTextStyle,
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onChanged: (value) {
        setState(() {
          Option2 = value;
        });
      },
      validator: (value) {
        //for validation
        RegExp regExp = new RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
          //if it does not matches the pattern, like
          //it not contains @
        }
      },
    );
  }

  TextFormField buildOption3Field(String label) {
    return TextFormField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.name,
      style: wInputTextStyle,
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onChanged: (value) {
        setState(() {
          Option3 = value;
        });
      },
      validator: (value) {
        //for validation
        RegExp regExp = new RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
          //if it does not matches the pattern, like
          //it not contains @
        }
      },
    );
  }

  TextFormField buildOption4Field(String label) {
    return TextFormField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.name,
      style: wInputTextStyle,
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onChanged: (value) {
        setState(() {
          Option4 = value;
        });
      },
      validator: (value) {
        //for validation
        RegExp regExp = new RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
          //if it does not matches the pattern, like
          //it not contains @
        }
      },
    );
  }
}
