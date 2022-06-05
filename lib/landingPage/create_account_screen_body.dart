import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ds_rent_cars/util/user.dart';
import 'package:flutter/material.dart';

import './/components/constants.dart';
import 'text_form_bar.dart';
import './/screens/MainScreen/main_screen.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String userName = '';
  late String email = '';
  late String password = '';
  late String mobileNumber = '';
  late String userId = '';

  final url = 'https://car-management-app-university.herokuapp.com';
  Dio dio = new Dio();

  Future<void> fetchRecommend(email, password, userName, mobileNumber) async {
    var data = {
      "email": email.toString(),
      "password": password,
      "firstName": userName,
      "mobileNumber": mobileNumber
    };
    try {
      var signUp = await dio.post('$url/users/signup', data: data);
      var user = signUp.data["user"];
      
      setState(() {
        userId = user["_id"];
        UserDataForShare().setId(userId);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(userId: userId,),
          ),
          (route) => false,
        );
      });
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      //reverse: true,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: size.height * 0.035,
              top: size.height * 0.06,
            ),
            height: size.height * 0.1,
            width: double.infinity,
            color: kLScrnTxtColor1,
            child: Stack(
              children: [
                Container(
                  height: size.width * 0.1,
                  width: size.width * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  right: size.width * 0.82,
                  top: -size.width * 0.0195,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: kLScrnTxtColor1,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    color: kLScrnTxtColor1,
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  padding: EdgeInsets.only(
                    left: size.width * 0.08,
                    top: size.width * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Creat",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Account",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Text(
                        "Please sign up in to continue",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          //SizedBox(height: size.height * 0.01),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.12,
            ),
            child: TxtForm(
              setValue: (val) => {userName = val},
              value: userName,
              labelTxt: "User Name",
              hintTxt: "Enter your user name",
              suffixIcon: Icon(
                Icons.person_outline_rounded,
              ),
              secure: false,
            ),
          ),
          SizedBox(height: size.height * 0.04),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.12,
            ),
            child: TxtForm(
              setValue: (val) => {email = val},
              value: email,
              labelTxt: "Email Address",
              hintTxt: "example@gmail.com",
              suffixIcon: Icon(
                Icons.email_outlined,
              ),
              secure: false,
            ),
          ),
          SizedBox(height: size.height * 0.04),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.12,
            ),
            child: TxtForm(
              setValue: (val) => {mobileNumber = val},
              value: mobileNumber,
              labelTxt: "Mobile Number",
              hintTxt: "7XXXXXXXX",
              suffixIcon: Icon(
                Icons.phone_android_rounded,
              ),
              secure: false,
            ),
          ),
          SizedBox(height: size.height * 0.04),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.12,
            ),
            child: TxtForm(
              setValue: (val) => {password = val},
              value: password,
              labelTxt: "Password",
              hintTxt: "Enter your password",
              suffixIcon: Icon(
                Icons.lock_outline_rounded,
              ),
              secure: true,
            ),
          ),
          SizedBox(height: size.height * 0.06),
          FlatButton(
            color: kLScrnTxtColor1,
            splashColor: kPrimaryColor,
            textColor: Colors.white,
            child: Text(
              'Sign Up & Continue',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              fetchRecommend(email, password, userName, mobileNumber);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            minWidth: size.width * 0.75,
            height: size.width * 0.125,
          ),
          SizedBox(height: size.height * 0.03),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, size.height * 0.9100000);
    path0.moveTo(0, size.height * 0.8200000);
    path0.quadraticBezierTo(size.width * 0.1021875, size.height * 0.7455000,
        size.width * 0.3787500, size.height * 0.8620000);
    path0.quadraticBezierTo(size.width * 0.6884375, size.height * 0.9800000,
        size.width, size.height * 0.4900000);
    path0.lineTo(size.width, size.height * -0.0760000);
    path0.lineTo(0, size.height * -0.0760000);
    path0.lineTo(0, size.height * 0.8200000);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
