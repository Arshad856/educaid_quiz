import 'package:brain_school/screens/Quiz_screen2/confirm_quiz.dart';
import 'package:flutter/material.dart';
import 'package:brain_school/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:brain_school/screens/quiz_screen/quiz_app_screen.dart';
import 'package:brain_school/screens/home_screen/home_screen2.dart';
//import 'package:flutter_progress_indicator/flutter_progress_indicator.dart';

class QuizResult extends StatefulWidget {
  static String routeName = 'QuizResult';

  const QuizResult(
      {Key? key,
      required this.score,
      required this.totalQuiz,
      required this.onPressed,
      required this.Grade,
      required this.Subject,
      required this.Term})
      : super(key: key);
  final int score;
  final int totalQuiz;
  final VoidCallback onPressed;
  final String Grade;
  final String Subject;
  final String Term;
  @override
  _QuizResultState createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  //check if the user is clicked

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover)
            //color: Color.fromARGB(255, 4, 1, 36),
            ),
        child: Stack(
          children: [
            Stack(
              children: [
                /*Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.9,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 4, 1, 36),
                  ),
                ),*/
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.9,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(70),
                          bottomRight: Radius.circular(70))),
                  //add elements here
                ),
                Container(
                  margin: EdgeInsets.only(left: 155.0, top: 180.0),
                  child: CircleAvatar(
                    child: Text(
                      '${widget.score}/${widget.totalQuiz}',
                      style: TextStyle(
                        fontSize: 21.0,
                        color: kTextBlackColor,
                      ),
                    ),
                    radius: 60.0,
                    backgroundColor: Colors.white,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Container(
                margin: EdgeInsets.only(
                    bottom: kDefaultPadding, left: 40.0, right: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.all(kDefaultPadding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kDefaultPadding),
                          color: kOtherColor,
                          boxShadow: [
                            BoxShadow(
                              color: kTextLightColor,
                              blurRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //blue color box

                                  //completeion
                                  Container(
                                    margin: EdgeInsets.only(left: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 6.0,
                                          backgroundColor: Colors.orange,
                                        ),
                                        Text(
                                          '100%',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.orange,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 20.0, top: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Completion',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 5.0, top: 50.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 6.0,
                                          backgroundColor: Colors.green,
                                        ),
                                        Text(
                                          '${widget.score}',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 20.0, top: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Correct',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              //next row start
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //blue color box

                                  //completeion
                                  Container(
                                    margin: EdgeInsets.only(left: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 6.0,
                                          backgroundColor: Colors.orange,
                                        ),
                                        Text(
                                          '${widget.totalQuiz}',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.orange,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 20.0, top: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total Questions',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 5.0, top: 50.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 6.0,
                                          backgroundColor: Colors.red,
                                        ),
                                        Text(
                                          '${(widget.totalQuiz) - (widget.score)}',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 20.0, top: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Wrong',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ])),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Container(
                margin: EdgeInsets.only(top: 410.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            //
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuizScreen(
                                          Grade: Grade,
                                          Subject: Subject,
                                          Term: Term,
                                        )));
                          },
                          child: Stack(children: [
                            CircleAvatar(
                              radius: 30.0,
                              backgroundColor: Colors.orange,
                              child: Center(
                                child: Image.asset(
                                  'assets/images/brreattempt.png',
                                  width: 80.0, // Adjust width as needed
                                  height: 80.0, // Adjust height as needed
                                ),
                              ),
                            ),
                            /*Image.asset(
                              'assets/images/re.svg',
                              width: 25.0, // Adjust width as needed
                              height: 25.0, // Adjust height as needed
                            ),*/
                          ]),
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: Stack(children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundColor: Colors.orange,
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/brpreview.png',
                                    width: 50.0, // Adjust width as needed
                                    height: 50.0, // Adjust height as needed
                                  ),
                                ),
                              ),
                            ]))
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 100.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()));
                                },
                                child: Stack(children: [
                                  CircleAvatar(
                                    radius: 30.0,
                                    backgroundColor: Colors.orange,
                                    child: Center(
                                      child: Image.asset(
                                        'assets/images/brHome.png',
                                        width: 50.0, // Adjust width as needed
                                        height: 50.0, // Adjust height as needed
                                      ),
                                    ),
                                  ),
                                  /*Image.asset(
                                    'assets/images/Home.jpg',
                                    width: 50.0, // Adjust width as needed
                                    height: 50.0, // Adjust height as needed
                                  ),*/
                                ]))
                          ],
                        ))
                  ],
                ),
              ),
            )
            //add svg images below
          ],
        ),
      ),
    );
  }
}
