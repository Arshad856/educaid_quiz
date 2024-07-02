import 'package:brain_school/constants.dart';
import 'package:brain_school/screens/assignment_screen/assignment_screen.dart';
import 'package:brain_school/screens/datesheet_screen/datesheet_screen.dart';
import 'package:brain_school/screens/login_screen/widgets/Homecard.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({Key? key}) : super(key: key);
  @override
  _TeacherScreenState createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
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
                        'Quiz Select',
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
                          DropDown(),
                          HomeCard(
                            title: 'Subject',
                          ),
                          SubjectDropDown(),
                          HomeCard(
                            title: 'Term',
                          ),
                          TermDropDown(),
                          end_buttons(title: 'Select'),
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
