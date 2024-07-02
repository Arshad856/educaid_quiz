import 'package:flutter/material.dart';
import 'package:brain_school/constants.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: const Text(
        'Next Question',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: kTextBlackColor,
        ),
      ),
    );
  }
}
