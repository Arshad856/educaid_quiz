import 'package:brain_school/constants.dart';
import 'package:flutter/material.dart';
import 'package:brain_school/constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({Key? key, required this.option, required this.color})
      : super(key: key);
  final String option;

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(
          option,
          style: TextStyle(
            fontSize: 22.0,
            color: kTextBlackColor,
          ),
        ),
      ),
    );
  }
}
