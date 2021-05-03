import 'package:flutter/material.dart';
import 'package:noboto_app/src/views/utils/size_config.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

Color? getFairnessColor(num fairness) {
  if (fairness > 0.25) return Colors.redAccent[700];
  if (fairness >= -0.25) return Colors.lightGreen[600];
  return Colors.blue[900];
}

String getFairnessText(num fairness) {
  if (fairness > 0.25) return "Desventaja";
  if (fairness >= -0.25) return "Intercambio justo";
  return "Ventaja";
}

Color? getConditionColor(num condition) {
  switch (condition) {
    case 1:
      return Colors.redAccent[700];
    case 2:
      return Colors.orange[400];
    case 3:
      return Colors.yellow[600];
    case 4:
      return Colors.lightGreen[400];
    case 5:
      return Colors.green;
    default:
      return Colors.grey;
  }
}

String getConditionText(num condition) {
  if (condition < 3) return "Deteriorado";
  if (condition < 4) return "Uso visible";
  return "Buen estado";
}
