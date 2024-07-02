import 'package:brain_school/constants.dart';
import 'package:brain_school/screens/Quiz_screen2/Homecard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'widgets/student_data.dart';
import 'package:brain_school/screens/Quiz_screen2/Quiz_Setting.dart';
import 'package:brain_school/screens/home_screen/home_screen2.dart';
import 'package:brain_school/screens/quiz_screen/quiz_app_screen.dart';

Map<String, WidgetBuilder> routes = {
  //all screens will be registered here like manifest in android

  HomeScreen.routeName: (context) => HomeScreen(),
  QuizSettingScreen.routeName: (context) => QuizSettingScreen(),
  ConfirmQuizScreen.routeName: (context) => ConfirmQuizScreen(
        selectedGradeValue: '',
        selectedSubjectValue: '',
        selectedTermValue: '',
        selectedUnitValue: '',
      ),
  //Bottom_NavBar.routeName: (context) => Bottom_NavBar(),
  //MyApp.routeName: (context) => MyApp(),
};

String Grade = selectedGradeValue ?? 'default';
String Unit = selectedUnitValue ?? 'default';
String Subject = selectedSubjectValue ?? 'default';
String Term = selectedTermValue ?? 'default';

class ConfirmQuizScreen extends StatefulWidget {
  const ConfirmQuizScreen({
    Key? key,
    required this.selectedGradeValue,
    required this.selectedSubjectValue,
    required this.selectedTermValue,
    required this.selectedUnitValue,
  }) : super(key: key);
  static String routeName = 'ConfirmQuizScreen';
  final String? selectedTermValue; // Maintain the selected value
  final String? selectedSubjectValue;
  final String? selectedGradeValue;
  final String? selectedUnitValue;
  @override
  State<ConfirmQuizScreen> createState() => _ConfirmQuizScreenState();
}

class _ConfirmQuizScreenState extends State<ConfirmQuizScreen> {
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

            unselectedItemColor: kBlackColor, // Set color for unselected items
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
            ],
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, HomeScreen.routeName);
                  break;
                case 1:
                  Navigator.pushNamed(context, QuizSettingScreen.routeName);
                  break;
                case 2:
                  Navigator.pushNamed(context, ConfirmQuizScreen.routeName);
                  break;
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottom(),
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
                              children: [
                                StudentDataCard(
                                  onPress: () {
                                    //go to attendance screen
                                  },
                                  title: 'Ahamed',
                                ),
                              ],
                            )
                          ])),
                    ),
                  ),
                  Positioned(
                      top: 110,
                      child: Text(
                        'Confirm Quiz',
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
            Container(
                // Replace with your image path
                ),

            //other will use all the remaining height of screen
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
                            .spaceBetween, // Align buttons to opposite ends
                        children: [
                          Confirmcard(
                              title: 'Grade',
                              option: selectedGradeValue.toString()),
                          Confirmcard(
                              title: 'Subject',
                              option: selectedSubjectValue.toString()),
                          Confirmcard(
                              title: 'Unit',
                              option: selectedUnitValue.toString()),
                          Confirmcard(
                              title: 'Term',
                              option: selectedTermValue.toString()),
                          Container(height: 30.0),
                          start_button(title: 'Start'),
                          back_button(title: 'Back')
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
}

class Confirmcard extends StatefulWidget {
  // Define a list of items for the dropdown
  const Confirmcard({Key? key, required this.title, required this.option})
      : super(key: key);
  final String title;
  final String option;

  @override
  State<Confirmcard> createState() => _ConfirmcardState();
}

class _ConfirmcardState extends State<Confirmcard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(top: 1.h),
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
                        blurStyle: BlurStyle.solid),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          fontFamily: 'Timmana'),
                    ),
                    Text('-',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            fontFamily: 'Timmana')),
                    Text(widget.option,
                        style: TextStyle(
                            color: kBlackColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            fontFamily: 'Timmana')),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}

class end_buttons extends StatefulWidget {
  const end_buttons({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<end_buttons> createState() => _end_buttonsState();
}

class _end_buttonsState extends State<end_buttons> {
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
          },
          child: Text(
            widget.title,
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

class start_button extends StatelessWidget {
  const start_button({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 1.h),
        width: 205.0,
        height: 69.0,
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => QuizScreen(
                          Grade: selectedGradeValue,
                          Subject: selectedSubjectValue,
                          Term: selectedTermValue,
                        )));
          },
          child: Text(
            title,
            style: TextStyle(
              color: kTextWhiteColor,
              fontWeight: FontWeight.w600,
              fontSize: 47,
              fontStyle: FontStyle.italic,
              fontFamily: 'Timmana',
            ),
          ),
        ),
      ),
    );
  }
}

class back_button extends StatelessWidget {
  const back_button({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 1.h),
        width: 214.0,
        height: 50.0,
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => QuizSettingScreen()));
          },
          child: Text(
            title,
            style: TextStyle(
              color: kTextWhiteColor,
              fontWeight: FontWeight.w600,
              fontSize: 42,
              fontStyle: FontStyle.italic,
              fontFamily: 'Timmana',
            ),
          ),
        ),
      ),
    );
  }
}
