import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

//colors
const Color kPrimaryColor = Colors.orange;
const Color kSecondaryColor = Color(0xFF6789CA);
const Color kTextBlackColor = Color(0xFF313131);
const Color kTextWhiteColor = Color(0xFFFFFFFF);
const Color kContainerColor = Color(0xFF777777);
const Color kBlackColor = Color.fromARGB(255, 0, 0, 0);
const Color kOtherColor = Color(0xFFF4F6F7);
const Color kTextLightColor = Color(0xFFA5A5A5);
const Color kErrorBorderColor = Color(0xFFE74C3C);

//form values
//set color for correct answer
const Color correct = Color(0xFF32AB58);
// set color for incorrect answer
const Color incorrect = Color(0xFFAB3232);
//set a neutral color
//not going to take pure white it hurt eyes
const Color neutral = Color(0xFFE7E7E7);
// set background color
const Color background = Color(0xFF1A3464);

//default value
const kDefaultPadding = 20.0;

const sizedBox = SizedBox(
  height: kDefaultPadding,
);
const kWidthSizedBox = SizedBox(
  width: kDefaultPadding,
);

const kHalfSizedBox = SizedBox(
  height: kDefaultPadding / 2,
);

const kHalfWidthSizedBox = SizedBox(
  width: kDefaultPadding / 2,
);

final kTopBorderRadius = BorderRadius.only(
  topLeft: Radius.circular(SizerUtil.deviceType == DeviceType.tablet ? 40 : 20),
  topRight:
      Radius.circular(SizerUtil.deviceType == DeviceType.tablet ? 40 : 20),
);

final kBottomBorderRadius = BorderRadius.only(
  bottomRight:
      Radius.circular(SizerUtil.deviceType == DeviceType.tablet ? 40 : 20),
  bottomLeft:
      Radius.circular(SizerUtil.deviceType == DeviceType.tablet ? 40 : 20),
);

final kInputTextStyle = GoogleFonts.poppins(
    color: kTextBlackColor, fontSize: 11.sp, fontWeight: FontWeight.w500);

final wInputTextStyle = GoogleFonts.poppins(
    color: kTextWhiteColor, fontSize: 11.sp, fontWeight: FontWeight.w500);

//validation for mobile
const String mobilePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

//validation for email
const String emailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
