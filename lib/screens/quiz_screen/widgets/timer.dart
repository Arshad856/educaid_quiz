import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:brain_school/screens/quiz_screen/widgets/result_widget.dart';

class NotificationNavigator extends StatelessWidget {
  final int score;
  final int totalQuiz;
  final VoidCallback onPressed;
  final String Grade;
  final String Subject;
  final String Term;

  NotificationNavigator(
      {required this.score,
      required this.totalQuiz,
      required this.onPressed,
      required this.Grade,
      required this.Subject,
      required this.Term});

  @override
  Widget build(BuildContext context) {
    // Play notification sound
    FlutterRingtonePlayer.playNotification();

    // Navigate to QuizResult page
    Future.delayed(Duration.zero, () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResult(
            score: score,
            totalQuiz: totalQuiz,
            onPressed: onPressed,
            Grade: Grade,
            Subject: Subject,
            Term: Term,
          ),
        ),
      );
    });

    // You can return an empty container or a loading indicator here
    return Container();
  }
}

// Usage:
/*NotificationNavigator(
  score: score,
  totalQuiz: 3,
  onPressed: startOver,
)*/
