import 'package:brain_school/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'widgets/student_data.dart';
import 'package:brain_school/screens/home_screen/home_screen2.dart';
import 'package:brain_school/screens/Quiz_screen2/confirm_quiz.dart';

Map<String, WidgetBuilder> routes = {
  //all screens will be registered here like manifest in android

  HomeScreen.routeName: (context) => HomeScreen(),
  QuizSettingScreen_1.routeName: (context) => QuizSettingScreen_1(),
  ConfirmQuizScreen.routeName: (context) => ConfirmQuizScreen(
        selectedGradeValue: '',
        selectedSubjectValue: '',
        selectedTermValue: '',
        selectedUnitValue: '',
      ),
  //Bottom_NavBar.routeName: (context) => Bottom_NavBar(),
  //MyApp.routeName: (context) => MyApp(),
};

class QuizSettingScreen_1 extends StatefulWidget {
  const QuizSettingScreen_1({Key? key}) : super(key: key);
  static String routeName = 'QuizSettingScreen';

  @override
  State<QuizSettingScreen_1> createState() => _QuizSettingScreenState();
}

class _QuizSettingScreenState extends State<QuizSettingScreen_1> {
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
                  Navigator.pushNamed(context, QuizSettingScreen_1.routeName);
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
                          drop_down(
                            item: [
                              'Grade 6',
                              'Grade 7',
                              'Grade 8',
                              'Grade 9',
                              'Grade 10',
                              'Grade 11'
                            ],
                            //selectedValue: "Grade 6",
                          ),
                          HomeCard(
                            title: 'Subject',
                          ),
                          drop_down(
                            item: [
                              'Maths',
                              'Science',
                              'History',
                              'English',
                              'Tamil',
                              'ICT',
                              'Art',
                              'Sinhala',
                              'Geography'
                            ],
                            //selectedValue: "Maths",
                          ),
                          HomeCard(
                            title: 'Unit',
                          ),
                          drop_down(
                            item: ['Unit 1', 'Unit 2', 'Unit 3', 'Unit 4'],
                            //selectedValue: "Unit 1",
                          ),
                          HomeCard(
                            title: 'Term',
                          ),
                          drop_down(
                            item: ['Term 1', 'Term 2', 'Term 3'],
                            //selectedValue: "Term 1",
                          ),
                          end_buttons(title: 'Submit'),
                          end_buttons(title: 'Reset')
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

class drop_down extends StatefulWidget {
  // Define a list of items for the dropdown
  drop_down({
    super.key,
    required this.item,
    //required this._selectedValue,
  });

  final List<String> item;

  @override
  State<drop_down> createState() => _drop_downState();
}

class _drop_downState extends State<drop_down> {
  String? _selectedValue;
  TextEditingController _grade_value = new TextEditingController();
  TextEditingController _Subject_value = new TextEditingController();
  TextEditingController _Unit_value = new TextEditingController();
  TextEditingController _Term_value = new TextEditingController();

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
              // DropdownButton widget
              Positioned(
                child: Container(
                  width: 300.0,
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      //alignment: AlignmentDirectional.centerStart,
                      value: _selectedValue,
                      isExpanded: true,
                      //icon: 'assets/icons/drop_down.svg',
                      hint: Text('Select Option'),
                      style: TextStyle(
                          color: kBlackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FontStyle.italic), // Initial selected value
                      onChanged: (newValue) {
                        // Handle dropdown value change
                        // This method will be called whenever the user selects an item
                        // You can perform any actions here based on the selected value
                        print('Selected: $newValue');
                        setState(() {
                          _selectedValue = newValue;
                        });
                      },
                      items: widget.item.map((String item) {
                        // DropdownMenuItem widgets
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 15.0,
          ),
        ],
      ),
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
