import 'package:brain_school/constants.dart';
import 'package:brain_school/screens/Quiz_screen2/confirm_quiz.dart';
import 'package:brain_school/screens/quiz_screen/data/quiz_data.dart';
import 'package:brain_school/screens/quiz_screen/widgets/result_widget.dart';
import 'package:brain_school/screens/quiz_screen/widgets/timer.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'widgets/quiz_widget.dart';
import 'widgets/next_button.dart';
import 'widgets/option_card.dart';
import '/constants.dart';
import 'package:brain_school/models/db_connect.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

int lendata = 4;

class QuizScreen extends StatefulWidget {
  const QuizScreen(
      {Key? key,
      required this.Grade,
      required this.Subject,
      required this.Term})
      : super(key: key);
  //static String routeName = 'QuizScreen';
  final String? Grade;
  final String? Subject;
  final String? Term;
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with TickerProviderStateMixin {
  /*List<Question> _questions = [
    Question(
      id: '10',
      title: 'what is 2 + 2 ?',
      options: {'5': false, '30': false, '4': true, '10': false},
    ),
    Question(
      id: '11',
      title: 'What is 10 + 20?',
      options: {'50': false, '30': true, '40': false, '10': false},
    )
  ];*/

  late AnimationController controller;
  var extractedData;

  int duration_size = 20;

  var db = DBconnect();
  late Future _questions;
  bool notifyCalled = false;

  Future<List<Question>> getData() async {
    //return db.fatchQuestions();
    return db.fatchselectedQuestions(Grade, Subject, Term);
  }

  Future<int> getDataLength() async {
    //List<Question> questions = await db.fatchQuestions();
    List<Question> questions =
        await db.fatchselectedQuestions(Grade, Subject, Term);
    return questions.length;
  }

  String get countText {
    Duration count = controller.duration! * controller.value;
    controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);

    return controller.isDismissed
        ? '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;
  void notify() {
    if (countText == '0:00:00') {
      FlutterRingtonePlayer.playNotification();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => QuizResult(
                  score: score,
                  totalQuiz: 3,
                  onPressed: startOver,
                  Grade: Grade,
                  Subject: Subject,
                  Term: Term))));
      //controller.dispose();
    }
  }

  @override
  void initState() {
    _questions = getData();
    /*WidgetsBinding.instance.addPostFrameCallback((_) {
      if (countText == '0:00:00') {
        setState(() {
          navigateToResult = true;
        });
      }
    });*/
    // Assign the future to _questions
    //print("length list:" + '$datalen');
    // Cast to List<Question>
    //datalen = data;
    //duration_size = extractedData.length;
    // Rest of your code

    getDataLength().then((length) {
      print('Length of newQuestions: $length');
      setState(() {
        lendata = length;
      });

      print('assign len:  $lendata');
      // Do something with the length value
    });
    // Initialize progress directly
    //notify();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: lendata * 180),
    );
    //controller?.duration = Duration(seconds: lendata * 180);
    print('new define value: $lendata');
    controller.addListener(() {
      //notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } /*else {
        setState(() {
          //progress = 1.0;
        });
      }*/
    });

    progress = controller.value;

    super.initState();
    //controller = AnimationController(vsync: this, duration: Duration.zero);
    // Delay the execution of notify after a short duration
    /*Future.delayed(Duration(milliseconds: 850), () {
      notify();
    });*/
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int index = 0;
  int score = 0;
  //check if the user is clicked
  bool isPressed = false;
  bool isAlreadySelected = false;
  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      // this is where the Question end.
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => QuizResult(
                  score: score,
                  totalQuiz: questionLength,
                  onPressed: startOver,
                  Grade: Grade,
                  Subject: Subject,
                  Term: Term))));
    } else {
      setState(() {
        index++;
        isPressed = false;
        isAlreadySelected = false;
      });
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<Question>>,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            extractedData = snapshot.data as List<Question>;
            duration_size = extractedData.length;
            /*if (navigateToResult) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                FlutterRingtonePlayer.playNotification();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => QuizResult(
                              score: score,
                              totalQuiz: 3,
                              onPressed: startOver,
                            ))));
              });
            }*/

            return Material(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg.jpg'),
                        fit: BoxFit.cover)
                    //color: Color.fromARGB(255, 4, 1, 36),
                    ),
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2.9,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(70),
                                  bottomRight: Radius.circular(70))),
                          //add elements here
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 158.0, top: 125.0),
                          child: AnimatedBuilder(
                              animation: controller,
                              builder: (context, child) {
                                if (countText == '0:00:01') {
                                  return NotificationNavigator(
                                    score: score,
                                    totalQuiz: extractedData.length,
                                    onPressed: startOver,
                                    Grade: Grade,
                                    Subject: Subject,
                                    Term: Term,
                                  );
                                  /*Future.delayed(Duration.zero, () {
                                    notify();
                                  });*/
                                } else {
                                  return Text(
                                    countText,
                                    style: TextStyle(
                                      fontSize: 21.0,
                                      color: kTextBlackColor,
                                    ),
                                  );
                                }
                              }),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 135.0, top: 80.0),
                          child: SizedBox(
                            width: 120,
                            height: 120,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.grey.shade300,
                              value: progress,
                              strokeWidth: 6,
                            ),
                          ),
                        ),
                      ],
                    ),

                    //replace the code here
                    Padding(
                      padding: EdgeInsets.all(kDefaultPadding),
                      child: Container(
                        margin: EdgeInsets.only(bottom: kDefaultPadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(kDefaultPadding),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kDefaultPadding),
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
                                      borderRadius: BorderRadius.circular(
                                          kDefaultPadding),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Question',
                                        style:
                                            Theme.of(context).textTheme.caption,
                                      ),
                                    ),
                                  ),
                                  kHalfSizedBox,
                                  QuestionWiget(
                                    indexAction: index,
                                    question: extractedData[index].title,
                                    totalQuestions: extractedData.length,
                                  ),
                                  kHalfSizedBox,
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            for (int i = 0;
                                i < extractedData[index].options.length;
                                i++)
                              GestureDetector(
                                onTap: () => checkAnswerAndUpdate(
                                    extractedData[index]
                                        .options
                                        .values
                                        .toList()[i]),
                                child: OptionCard(
                                  option: extractedData[index]
                                      .options
                                      .keys
                                      .toList()[i],
                                  color: isPressed
                                      ? extractedData[index]
                                                  .options
                                                  .values
                                                  .toList()[i] ==
                                              true
                                          ? correct
                                          : incorrect
                                      : neutral,
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                    /*Scaffold(
              floatingActionButton: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: NextButton(
                  nextQuestion: nextQuestion,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              //add svg images below
            )*/
                    Padding(
                      padding: EdgeInsets.all(kDefaultPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () =>
                                  nextQuestion(extractedData.length),
                              child: NextButton(),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.orange),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const Center(
          child: Text('No Data'),
        );
      },
    );
  }
}
