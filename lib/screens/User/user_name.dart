import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  final Size size;
  final String fNameAndLastName;
  final String userName;

  UserName({
    required this.size,
    required this.fNameAndLastName,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.12,
      width: size.width * 0.9,
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 5,
      ),
      child: Column(
        children: [
          Text(
            fNameAndLastName,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.grey[850],
            ),
          ),
          SizedBox(height: size.height * 0.005),
          Text(
            userName,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
              fontSize: 15,
              color: Colors.grey[850],
            ),
          ),
        ],
      ),
    );
  }
}
