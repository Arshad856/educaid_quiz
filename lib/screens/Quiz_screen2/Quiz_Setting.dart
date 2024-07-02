import 'package:brain_school/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'widgets/student_data.dart';
import 'package:brain_school/screens/home_screen/home_screen2.dart';
import 'package:brain_school/screens/Quiz_screen2/confirm_quiz.dart';
import 'package:brain_school/screens/Quiz_screen2/Homecard.dart';

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

class QuizSettingScreen extends StatefulWidget {
  const QuizSettingScreen({Key? key}) : super(key: key);
  static String routeName = 'QuizSettingScreen';

  @override
  State<QuizSettingScreen> createState() => _QuizSettingScreenState();
}

TextEditingController Grade_edit = TextEditingController();
TextEditingController Subject_edit = TextEditingController();
TextEditingController Unit_edit = TextEditingController();
TextEditingController Term_edit = TextEditingController();

class _QuizSettingScreenState extends State<QuizSettingScreen> {
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
    String? _selectedVal;
    final List<String> unit = ['Unit 1', 'Unit 2', 'Unit 3', 'Unit 4'];
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
                        'Quiz Settings',
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
                          HomeCard(
                            title: 'Grade',
                          ),
                          GradeDropDown(),
                          //selectedValue: "Grade 6",
                          HomeCard(
                            title: 'Subject',
                          ),
                          SubjectDropDown(),
                          HomeCard(
                            title: 'Unit',
                          ),
                          UnitDropDown(),
                          HomeCard(
                            title: 'Term',
                          ),
                          TermDropDown(),
                          //selectedValue: "Term 1",

                          submit_buttons(title: 'Submit'),
                          reset_button(title: 'Reset')
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

class HomeCard extends StatefulWidget {
  const HomeCard({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
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
              widget.title,
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

class submit_buttons extends StatefulWidget {
  const submit_buttons({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<submit_buttons> createState() => _submit_buttonsState();
}

class _submit_buttonsState extends State<submit_buttons> {
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
          onPressed: () async {
            // Handle right button action
            Grade_edit.text = selectedGradeValue!;
            Subject_edit.text = selectedSubjectValue!;
            Term_edit.text = selectedTermValue!;
            Unit_edit.text = selectedUnitValue!;
            print('question type selected');
            print(selectedGradeValue!);
            print(selectedTermValue!);
            print(selectedSubjectValue!);
            print(selectedUnitValue!);
            print(selectedGradeValue!);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ConfirmQuizScreen(
                        selectedGradeValue: Grade_edit.text,
                        selectedSubjectValue: Subject_edit.text,
                        selectedTermValue: Term_edit.text,
                        selectedUnitValue: Unit_edit.text,
                      )),
            );
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

class reset_button extends StatefulWidget {
  const reset_button({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<reset_button> createState() => _reset_buttonState();
}

class _reset_buttonState extends State<reset_button> {
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
            setState(() {
              selectedGradeValue = null;
              selectedSubjectValue = null;
              selectedTermValue = null;
              selectedUnitValue = null;
            });
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
