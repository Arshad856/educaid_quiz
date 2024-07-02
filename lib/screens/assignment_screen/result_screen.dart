import 'package:flutter/material.dart';
import 'package:brain_school/constants.dart';
import 'package:sizer/sizer.dart';
//import 'package:flutter_progress_indicator/flutter_progress_indicator.dart';

class QuizResultScreen extends StatefulWidget {
  static String routeName = 'QuizResultScreen';

  const QuizResultScreen({
    Key? key,
  }) : super(key: key);

  @override
  _QuizResultScreenState createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> {
  int index = 0;
  int score = 0;
  //check if the user is clicked

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
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
              ],
            ),
            Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Container(
                margin: EdgeInsets.only(bottom: kDefaultPadding, left: 80.0),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 40.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: kSecondaryColor.withOpacity(0.4),
                              borderRadius:
                                  BorderRadius.circular(kDefaultPadding),
                            ),
                            child: Center(
                              child: Text(
                                'Question',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                          ),
                          kHalfSizedBox,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
