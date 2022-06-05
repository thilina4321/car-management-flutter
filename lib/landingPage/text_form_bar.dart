import 'package:flutter/material.dart';

import './/components/constants.dart';

class TxtForm extends StatefulWidget {
  final String labelTxt;
  final String hintTxt;
  final Icon suffixIcon;
  final bool secure;
  String value;
  Function setValue;

  TxtForm({
    required this.labelTxt,
    required this.hintTxt,
    required this.suffixIcon,
    required this.secure,
    required this.value,
    required this.setValue,
  });

  @override
  State<TxtForm> createState() => _TxtFormState();
}

class _TxtFormState extends State<TxtForm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFormField(
      onChanged: (val) {
        setState(() {
          widget.setValue(val);
        });
      },
      obscureText: widget.secure,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.only(
            right: size.width * 0.04,
          ),
          child: Icon(
            widget.suffixIcon.icon,
            size: 28,
            color: kLScrnTxtColor1,
          ),
        ),
        label: Text(
          widget.labelTxt,
          style: TextStyle(
            color: kLScrnTxtColor2,
            fontSize: 20,
          ),
        ),
        hintText: widget.hintTxt,
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
