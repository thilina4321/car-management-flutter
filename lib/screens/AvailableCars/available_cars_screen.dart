import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../components/vehicle_data.dart';
import './/components/constants.dart';
import './/screens/components/vehicle_card_rectangle_box.dart';

class AvailableCarsScreen extends StatefulWidget {
  @override
  State<AvailableCarsScreen> createState() => _AvailableCarsScreenState();
}

class _AvailableCarsScreenState extends State<AvailableCarsScreen> {
  var availableCars = [];
  final List<Cars> getCarsList = [];

  final url = 'https://car-management-app-university.herokuapp.com';

  Dio dio = new Dio();

  Future<void> fetchAvailable() async {
    try {
      var availableCars = await dio.get('$url/cars/available');
      List cars = availableCars.data['cars'];
      setState(() {
        cars.forEach((element) {
          List fav = element['fav'];
          getCarsList.add(Cars(
            description: element['description'],
            id: element['id'],
            title: element['vehicleName'],
            price: element['price'],
            image: "assets/images/acura_0.png",
            year: element['year'],
            transmission: element['transmission'],
            fuelType: element['fuelType'],
            seats: element['seats'],
            ac: element['ac'],
            fav: fav,

            //pressAction: () {},
          ));
        });
      });
    } catch (e) {
      throw e;
    }
  }

  @override
  void initState() {
    fetchAvailable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: size.height * 0.1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: kPrimaryColor,
            size: 30,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
              right: kDefaultPadding / 2,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  margin: EdgeInsets.all(
                    kDefaultPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Positioned(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Available ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: kPrimaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: 'Cars',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.grey[900],
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: getCarsList
            .map(
              (car) => VehicleCard(
                id: car.id,
                title: car.title,
                year: car.year,
                price: car.price,
                description: car.description,
                transmission: car.transmission,
                seats: car.seats,
                ac: car.ac,
                fuelType: car.fuelType,
                fav: car.fav,
              ),
            )
            .toList(),
      ),
    );
  }
}
