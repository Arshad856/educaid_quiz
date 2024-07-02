import 'package:brain_school/components/custom_buttons.dart';
import 'package:brain_school/constants.dart';
import 'package:brain_school/screens/home_screen/home_screen2.dart';
import 'package:brain_school/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/svg.dart';

late bool _passwordVisible;

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //validate our form now
  //final FirebaseAuthService _auth = FirebaseAuthService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isSigningUp = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //changes current state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        //when user taps anywhere on the screen, keyboard hides
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Material(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.jpg'),
                    fit: BoxFit.cover)
                //color: Color.fromARGB(255, 4, 1, 36),
                ),
            child: Stack(children: [
              Column(
                children: [
                  Container(
                    width: 100.w,
                    height: 20.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Create Account',
                                style: Theme.of(context).textTheme.subtitle1),
                            SvgPicture.asset(
                              'assets/icons/ProfilePict.svg', // Replace with the path to your SVG file
                              width: 60, // Optional: Set the width of the icon
                              height:
                                  60, // Optional: Set the height of the icon // Optional: Color the icon
                              // Optional: Set a semantic label
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 5.w, right: 5.w),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              sizedBox,
                              buildNameField(),
                              sizedBox,
                              buildEmailField(),
                              sizedBox,
                              buildPasswordField(),
                              sizedBox,
                              DefaultButton(
                                onPress: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        HomeScreen.routeName, (route) => false);
                                  }
                                },
                                title: 'SIGN UP',
                                iconData: Icons.arrow_forward_outlined,
                              ),
                              sizedBox,
                              DefaultButton(
                                onPress: () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      LoginScreen.routeName, (route) => false);
                                },
                                title: 'SIGN IN',
                                iconData: Icons.arrow_forward_outlined,
                              ),
                              sizedBox,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }

  TextFormField buildEmailField() {
    return TextFormField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: kInputTextStyle,
      decoration: InputDecoration(
        labelText: 'Mobile Number/Email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        //for validation
        RegExp regExp = new RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
          //if it does not matches the pattern, like
          //it not contains @
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter a valid email address';
        }
      },
    );
  }

  TextFormField buildNameField() {
    return TextFormField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.name,
      style: kInputTextStyle,
      decoration: InputDecoration(
        labelText: 'Full Name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        //for validation
        RegExp regExp = new RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
          //if it does not matches the pattern, like
          //it not contains @
        }
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      obscureText: _passwordVisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      style: kInputTextStyle,
      decoration: InputDecoration(
        labelText: 'Password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: Icon(
            _passwordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_off_outlined,
          ),
          iconSize: kDefaultPadding,
        ),
      ),
      validator: (value) {
        if (value!.length < 5) {
          return 'Must be more than 5 characters';
        }
      },
    );
  }

  /*void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      isSigningUp = false;
    });
    if (user != null) {
      showToast(message: "User is successfully created");
      Navigator.pushNamed(context, "/home");
    } else {
      showToast(message: "Some error happend");
    }
  }*/
}
