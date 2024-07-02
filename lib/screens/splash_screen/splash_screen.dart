import 'package:brain_school/screens/login_screen/choose_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  //route name for our screen
  static String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //we use future to go from one screen to other via duration time
    Future.delayed(Duration(seconds: 5), () {
      //no return when user is on login screen and press back, it will not return the
      //user to the splash screen
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ChooseScreen()));
    });
  }

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('School', style: Theme.of(context).textTheme.headline5),
                Text('Brain', style: Theme.of(context).textTheme.headline5),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.orange,
                  ),
                )
              ],
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/images/Blackkeyhole.png',
                //25% of height & 50% of width
                height: 25.h,
                width: 50.w,
              ),
            ])
          ],
        ),
      ),
    );
  }
}
