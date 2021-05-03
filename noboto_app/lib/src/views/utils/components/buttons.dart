import 'package:flutter/material.dart';

class BlueButtonWidget extends StatelessWidget {
  const BlueButtonWidget({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        primary: Color(0xFF1F3A83),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        minimumSize: Size(307, 56),
      ),
    );
  }
}
