import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ds_rent_cars/screens/BookedVehicles/booked_vehicles_screen.dart';
import 'package:ds_rent_cars/screens/MainScreen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './/components/constants.dart';

import 'vehicle_info_card.dart';

class VehicleInfoBody extends StatefulWidget {
  final String title;
  final String price;
  final String year;
  final String description;
  final String transmission;
  final String fuelType;
  final String seats;
  final String ac;
  final String id;

  VehicleInfoBody({
    required this.title,
    required this.price,
    required this.year,
    required this.description,
    required this.transmission,
    required this.fuelType,
    required this.seats,
    required this.ac,
    required this.id,
  });
  @override
  State<VehicleInfoBody> createState() => _VehicleInfoBodyState();
}

class _VehicleInfoBodyState extends State<VehicleInfoBody> {
  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        child: BottomSheetDesign(
          title: widget.title,
          price: widget.price,
          daysCount: 3,
          year: widget.year,
          id: widget.id,
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }

  final url = 'https://car-management-app-university.herokuapp.com';

  Dio dio = new Dio();

  String userId = '';

  Future<void> getUserId() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var user = prefs.getString('user');
    if (user != null) {
      userId = user as String;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return VehicleInfoCard(
      vehicleName: widget.title,
      year: widget.year,
      image: "assets/images/ferrari_spider_488_0.png",
      price: int.parse(widget.price),
      description: widget.description,
      transmission: widget.transmission,
      fuelType: widget.fuelType,
      seats: widget.seats,
      ac: widget.ac,
      showBottomSheet: showBottomSheet,
    );
  }
}

class BottomSheetDesign extends StatefulWidget {
  final title;
  final price;
  final daysCount;
  final year;
  final id;
  const BottomSheetDesign(
      {Key? key,
      required this.title,
      required this.price,
      required this.year,
      required this.id,
      required this.daysCount})
      : super(key: key);

  @override
  State<BottomSheetDesign> createState() => _BottomSheetDesignState();
}

class _BottomSheetDesignState extends State<BottomSheetDesign> {
  String userId = '';

  Future<void> getUserId() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var user = prefs.getString('user');
    if (user != null) {
      userId = user as String;
    }
  }

  final url = 'https://car-management-app-university.herokuapp.com';

  Dio dio = new Dio();
  String value = "1";

  Future<void> makeOrder(days) async {
    var data = {"userId": userId, "carId": widget.id, "days": days};
    try {
      await dio.post('$url/cars/booked', data: data);
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(
              userId: userId,
            ),
          ),
        );
      });
    } catch (e) {
      throw e;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height * 1,
        width: size.width,
        padding: EdgeInsets.only(
          left: size.width * 0.08,
          right: size.width * 0.08,
          top: size.width * 0.1,
          bottom: size.width * 0.04,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.year,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Rs" + widget.price.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "/ day",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: size.width * 0.08),
            Text(
              "How many days you want?",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              onChanged: (val) => value = val,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: Text(
                  "Days",
                  style: TextStyle(
                    color: kLScrnTxtColor2,
                    fontSize: 20,
                  ),
                ),
                hintText: "Number of days",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: kLScrnTxtColor1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: kLScrnTxtColor1,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.width * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${int.parse(widget.price) * int.parse(value)} /==",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                FlatButton(
                  color: kLScrnTxtColor1,
                  splashColor: kPrimaryColor,
                  textColor: Colors.white,
                  child: Text(
                    'Confirm the Order',
                    style: TextStyle(fontSize: 10),
                  ),
                  onPressed: () {
                    makeOrder(value);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  minWidth: size.width * 0.25,
                  height: size.width * 0.12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetTxtField extends StatefulWidget {
  final String label;
  final String hintTxt;
  final String value;

  BottomSheetTxtField({
    required this.label,
    required this.hintTxt,
    required this.value,
  });

  @override
  State<BottomSheetTxtField> createState() => _BottomSheetTxtFieldState();
}

class _BottomSheetTxtFieldState extends State<BottomSheetTxtField> {
  String userId = '';

  Future<void> getUserId() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var user = prefs.getString('user');
    if (user != null) {
      userId = user as String;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        right: size.width * 0.5,
        bottom: size.width * 0.02,
        top: size.width * 0.02,
      ),
      child: TextFormField(
        onChanged: (val) => {},
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text(
            widget.label,
            style: TextStyle(
              color: kLScrnTxtColor2,
              fontSize: 20,
            ),
          ),
          hintText: widget.hintTxt,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: kLScrnTxtColor1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: kLScrnTxtColor1,
            ),
          ),
        ),
      ),
    );
  }
}
