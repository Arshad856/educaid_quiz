import 'package:brain_school/screens/login_screen/login_screen.dart';
import 'package:brain_school/screens/quiz_screen/quiz_app_screen.dart';
import 'package:brain_school/screens/splash_screen/splash_screen.dart';
import 'package:brain_school/screens/assignment_screen/result_screen.dart';

import 'package:flutter/cupertino.dart';
import 'screens/assignment_screen/assignment_screen.dart';
import 'screens/datesheet_screen/datesheet_screen.dart';
import 'screens/fee_screen/fee_screen.dart';
import 'screens/home_screen/home_screen2.dart';
import 'screens/my_profile/my_profile.dart';
import 'package:brain_school/screens/Quiz_screen2/Quiz_Setting.dart';
import 'screens/Quiz_screen2/confirm_quiz.dart';

Map<String, WidgetBuilder> routes = {
  //all screens will be registered here like manifest in android
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  MyProfileScreen.routeName: (context) => MyProfileScreen(),
  FeeScreen.routeName: (context) => FeeScreen(),
  AssignmentScreen.routeName: (context) => AssignmentScreen(),
  DateSheetScreen.routeName: (context) => DateSheetScreen(),
  //QuizScreen.routeName: (context) => QuizScreen(),
  QuizResultScreen.routeName: (context) => QuizResultScreen(),
  QuizSettingScreen.routeName: (context) => QuizSettingScreen(),
  ConfirmQuizScreen.routeName: (context) => ConfirmQuizScreen(
        selectedGradeValue: '',
        selectedSubjectValue: '',
        selectedTermValue: '',
        selectedUnitValue: '',
      ),
};
