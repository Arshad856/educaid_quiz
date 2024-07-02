import 'package:brain_school/screens/login_screen/login_screen.dart';
import 'package:brain_school/screens/login_screen/teacher_quiz_select.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:brain_school/components/custom_buttons.dart';
import 'package:brain_school/constants.dart';

class ChooseScreen extends StatefulWidget {
  //route name for our screen

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  @override
  /*void initState() {
    // TODO: implement initState
    super.initState();
    //we use future to go from one screen to other via duration time
    Future.delayed(Duration(seconds: 5), () {
      //no return when user is on login screen and press back, it will not return the
      //user to the splash screen
      Navigator.pushNamedAndRemoveUntil(
          context, LoginScreen.routeName, (route) => false);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    //scaffold color set to primary color in main in our text theme
    return Material(
      //its a row with a column
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover)
            //color: Color.fromARGB(255, 4, 1, 36),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/Blackkeyhole.png',
                  //25% of height & 50% of width
                  height: 25.h,
                  width: 50.w,
                ),
              ],
            ),
            sizedBox,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultButton(
                  onPress: () {},
                  title: 'PICK YOUR PROFILE',
                  iconData: Icons.arrow_downward_rounded,
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.routeName, (route) => false);
                },
                child: Container(
                    width: 150, // Adjust this value as needed
                    height: 150, // Adjust this value as needed
                    padding: EdgeInsets.all(kDefaultPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kDefaultPadding),
                      color: Colors.orange,
                      boxShadow: [
                        BoxShadow(
                          color: kTextLightColor,
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'I am a Student',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
              GestureDetector(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => TeacherScreen())));
                }),
                child: Container(
                  width: 150, // Adjust this value as needed
                  height: 150, // Adjust this value as needed
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kDefaultPadding),
                    color: Colors.orange,
                    boxShadow: [
                      BoxShadow(
                        color: kTextLightColor,
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'I am a Teacher',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
