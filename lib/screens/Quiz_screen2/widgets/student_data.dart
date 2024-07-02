import 'package:brain_school/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:brain_school/screens/my_profile/my_profile.dart';
import 'package:flutter_svg/svg.dart';

class StudentName extends StatelessWidget {
  const StudentName({Key? key, required this.studentName}) : super(key: key);
  final String studentName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Hi ', style: Theme.of(context).textTheme.subtitle1),
        Text(studentName, style: Theme.of(context).textTheme.subtitle1),
      ],
    );
  }
}

class StudentClass extends StatelessWidget {
  const StudentClass({Key? key, required this.studentClass}) : super(key: key);
  final String studentClass;
  @override
  Widget build(BuildContext context) {
    return Text(studentClass, style: Theme.of(context).textTheme.subtitle2);
  }
}

class StudentYear extends StatelessWidget {
  const StudentYear({Key? key, required this.studentYear}) : super(key: key);

  final String studentYear;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: SizerUtil.deviceType == DeviceType.tablet ? 4.h : 3.h,
      decoration: BoxDecoration(
        color: kOtherColor,
        borderRadius: BorderRadius.circular(kDefaultPadding),
      ),
      child: Center(
        child: Text(
          studentYear,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                color: kTextBlackColor,
              ),
        ),
      ),
    );
  }
}

class StudentPicture extends StatelessWidget {
  const StudentPicture(
      {Key? key, required this.picAddress, required this.onPress})
      : super(key: key);
  final String picAddress;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: CircleAvatar(
        radius: 40,
        backgroundColor: kSecondaryColor,
        backgroundImage: AssetImage(picAddress),
      ),
    );
  }
}

class StudentDataCard extends StatelessWidget {
  const StudentDataCard({Key? key, required this.title, required this.onPress})
      : super(key: key);
  final String title;

  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: 370,
        height: 70,
        decoration: BoxDecoration(
          color: kOtherColor.withOpacity(0.43),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: StudentPicture(
                    picAddress: 'assets/images/profile.png',
                    onPress: () {
                      // go to profile detail screen here
                      Navigator.pushNamed(context, MyProfileScreen.routeName);
                    }),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: kTextBlackColor,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(
                  'assets/icons/bar_line.svg', // Replace with the path to your SVG file
                  width: 38, // Optional: Set the width of the icon
                  height: 38, // Optional: Set the height of the icon
                  color: kTextBlackColor, // Optional: Color the icon
                  // Optional: Set a semantic label
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
