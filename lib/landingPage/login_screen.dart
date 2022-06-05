import 'package:dio/dio.dart';
import 'package:ds_rent_cars/util/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './/screens/MainScreen/main_screen.dart';
import './/components/constants.dart';
import './/landingPage/create_account_screen.dart';
import 'text_form_bar.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool remember = false;
  late String email = '';
  late String password = '';
  String userId = '';

  final url = 'https://car-management-app-university.herokuapp.com';
  Dio dio = new Dio();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  

  Future<void> fetchRecommend(email, password) async {
    var data = {
      "email": email.toString(),
      "password": password,
    };
    try {
      var signIn = await dio.post('$url/users/signin', data: data);
      var user = signIn.data["user"];

      userId = user['_id'];
      final SharedPreferences prefs = await _prefs;
      await prefs.setString('user', userId);

      setState(() {
        UserDataForShare().setId(userId);

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(
              userId: userId,
            ),
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
          SizedBox(height: size.height * 0.07),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.15,
            ),
            child: Text(
              "Sign In",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: kLScrnTxtColor2,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.06),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.15,
            ),
            margin: EdgeInsets.only(
              bottom: size.width * 0.02,
            ),
            child: Text(
              "Welcome Back",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: kLScrnTxtColor2,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Container(
            margin: EdgeInsets.only(
              bottom: size.width * 0.02,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.15,
            ),
            child: Text(
              "sign in with your email and password or continue with social media",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.075),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.12,
            ),
            child: TxtForm(
              setValue: (val) => {email = val},
              value: email,
              labelTxt: "Email",
              hintTxt: "example@gmail.com",
              suffixIcon: Icon(
                Icons.email_outlined,
              ),
              secure: false,
            ),
          ),
          SizedBox(height: size.height * 0.05),
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
          SizedBox(height: size.height * 0.025),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.12,
            ),
            child: Row(
              children: [
                Checkbox(
                  value: remember,
                  onChanged: (value) {
                    setState(
                      () {
                        remember = value!;
                      },
                    );
                  },
                  activeColor: kLScrnTxtColor1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Text(
                  "Remember me",
                  style: TextStyle(
                    color: kLScrnTxtColor1,
                    fontSize: 15,
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                      color: Colors.red[600],
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.02),
          FlatButton(
            color: kLScrnTxtColor1,
            splashColor: kPrimaryColor,
            textColor: Colors.white,
            child: Text(
              'Continue',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              fetchRecommend(email, password);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            minWidth: size.width * 0.75,
            height: size.width * 0.125,
          ),
          SizedBox(height: size.height * 0.05),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: size.width * 0.12,
                    width: size.width * 0.12,
                    margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.02,
                    ),
                    //padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image:
                            AssetImage("assets/login screen images/google.png"),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: size.width * 0.12,
                    width: size.width * 0.12,
                    margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.02,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/login screen images/facebook.png"),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: size.width * 0.12,
                    width: size.width * 0.12,
                    margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.02,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/login screen images/twitter.png"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.05),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Dont have an account?",
                  style: TextStyle(
                    color: kLScrnTxtColor2,
                    fontSize: 15,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ontext) => CreateAnAccountScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.red[600],
                      decoration: TextDecoration.underline,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.01),
        ],
      ),
    );
  }
}
