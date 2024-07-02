import 'package:brain_school/constants.dart';
import 'package:brain_school/screens/assignment_screen/assignment_screen.dart';
import 'package:brain_school/screens/datesheet_screen/datesheet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'widgets/student_data2.dart';
import 'package:brain_school/screens/Quiz_screen2/Quiz_Setting.dart';
import 'package:brain_school/screens/Quiz_screen2/confirm_quiz.dart';

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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            selectedItemColor: kOtherColor, // Set color for selected items
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
              height: 35.h,
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
                    top: 80,
                    child: Container(
                      width: 369,
                      height: 217,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        // Rectangle border
                        borderRadius: BorderRadius.circular(
                            46.0), // Optional: Rounded corners
                      ),
                      // Optional: Add padding
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            46.0), // Same radius as the BoxDecoration
                        child: Image.asset(
                          'assets/images/quiz.jpg',
                          fit: BoxFit.cover,
                          // Replace with your image URL
                          // You can use different BoxFit options based on your needs
                        ),
                      ),
                    ),
                  )
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // Align buttons to opposite ends
                        children: [
                          TextButton(
                            onPressed: () {
                              // Handle left button action
                            },
                            child: Text(
                              'Top Quiz Categories',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                                fontFamily: 'Times new Roman',
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  15.0), // Rounded corners
                              color: kOtherColor,
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                // Handle right button action
                              },
                              child: Text(
                                'View All',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  fontFamily: 'Times new Roman',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HomeCard(
                            onPress: () {},
                            icon: 'assets/icons/maths.svg',
                            title: 'Maths',
                          ),
                          HomeCard(
                            onPress: () {
                              //go to assignment screen here
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ConfirmQuizScreen(
                                  selectedGradeValue: "10",
                                  selectedSubjectValue: "Maths",
                                  selectedTermValue: "Term 1",
                                  selectedUnitValue: "Unit 1",
                                ),
                              ));
                            },
                            icon: 'assets/icons/science.svg',
                            title: 'Science',
                          ),
                          HomeCard(
                            onPress: () {
                              //go to assignment screen here
                              Navigator.pushNamed(
                                  context, AssignmentScreen.routeName);
                            },
                            icon: 'assets/icons/Herodotus.svg',
                            title: 'History',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HomeCard(
                            onPress: () {},
                            icon: 'assets/icons/english.svg',
                            title: 'English',
                          ),
                          HomeCard(
                            onPress: () {},
                            icon: 'assets/icons/language-svgrepo-com.svg',
                            title: 'Tamil',
                          ),
                          HomeCard(
                            onPress: () {},
                            icon: 'assets/icons/ict.svg',
                            title: 'ICT',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HomeCard(
                            onPress: () {},
                            icon: 'assets/icons/art.svg',
                            title: 'Art',
                          ),
                          HomeCard(
                            onPress: () {
                              Navigator.pushNamed(
                                  context, DateSheetScreen.routeName);
                            },
                            icon: 'assets/icons/language-svgrepo-com.svg',
                            title: 'Sinhala',
                          ),
                          HomeCard(
                            onPress: () {
                              Navigator.pushNamed(
                                  context, DateSheetScreen.routeName);
                            },
                            icon:
                                'assets/icons/geography-global-svgrepo-com.svg',
                            title: 'Geography',
                          ),
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

class HomeCard extends StatelessWidget {
  const HomeCard(
      {Key? key,
      required this.onPress,
      required this.icon,
      required this.title})
      : super(key: key);
  final VoidCallback onPress;
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: 1.h),
        width: 127.6,
        height: 123.32,
        decoration: BoxDecoration(
          color: kOtherColor,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 0, 0, 0),
                spreadRadius: 10,
                blurRadius: 10,
                blurStyle: BlurStyle.solid),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: SizerUtil.deviceType == DeviceType.tablet ? 30.sp : 40.sp,
              width: SizerUtil.deviceType == DeviceType.tablet ? 30.sp : 40.sp,
              //color: kBlackColor,
            ),
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
                  fontSize: 20,
                  fontFamily: 'Times new Roman'),
            ),
          ],
        ),
      ),
    );
  }
}
