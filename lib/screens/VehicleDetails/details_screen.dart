import 'package:dio/dio.dart';
import 'package:ds_rent_cars/util/user.dart';
import 'package:flutter/material.dart';

import 'body.dart';
import './/components/constants.dart';

class DetailsScreen extends StatefulWidget {
  final title;
  final year;
  final int price;
  final description;
  final seats;
  final ac;
  final fuelType;
  final transmission;
  final List fav;
  final String id;

  DetailsScreen({
    required this.title,
    required this.year,
    required this.price,
    required this.description,
    required this.seats,
    required this.ac,
    required this.fuelType,
    required this.transmission,
    required this.fav,
    required this.id,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String userId = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userId = UserDataForShare().getUserId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InfoScreenAppBar(context),
      body: VehicleInfoBody(
        id: widget.id,
        title: widget.title,
        description: widget.description,
        year: widget.year.toString(),
        price: widget.price.toString(),
        seats: widget.seats,
        ac: widget.ac,
        transmission: widget.transmission,
        fuelType: widget.fuelType,
      ),
    );
  }

  AppBar InfoScreenAppBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor,
      leading: Container(
        padding: EdgeInsets.only(
          top: size.width * 0.02,
        ),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new, 
            size: 30,
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      actions: [
        Container(
          padding: EdgeInsets.only(
            top: size.width * 0.02,
          ),
          margin: EdgeInsets.only(
            right: kDefaultPadding / 2,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_rounded,
              size: 30,
              color: widget.fav.contains(userId) ? Colors.red : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
