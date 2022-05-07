import 'package:flutter/material.dart';

import './/components/constants.dart';

class TxtForm extends StatelessWidget {
  final String labelTxt;
  final String hintTxt;
  final Icon suffixIcon;
  final bool secure;

  TxtForm({
    required this.labelTxt,
    required this.hintTxt,
    required this.suffixIcon,
    required this.secure,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFormField(
      obscureText: secure,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.only(
            right: size.width * 0.04,
          ),
          child: Icon(
            suffixIcon.icon,
            size: 28,
            color: kLScrnTxtColor1,
          ),
        ),
        label: Text(
          labelTxt,
          style: TextStyle(
            color: kLScrnTxtColor2,
            fontSize: 20,
          ),
        ),
        hintText: hintTxt,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color: kLScrnTxtColor1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            color: kLScrnTxtColor1,
          ),
        ),
      ),
    );
  }
}
