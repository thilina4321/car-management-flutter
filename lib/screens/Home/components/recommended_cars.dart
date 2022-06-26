import 'dart:developer';

import 'package:ds_rent_cars/util/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/constants.dart';
import '../../../components/vehicle_data.dart';
import './/screens/VehicleDetails/details_screen.dart';
import 'package:dio/dio.dart';

class RecommendedCars extends StatefulWidget {
  @override
  State<RecommendedCars> createState() => _RecommendedCarsState();
}

class _RecommendedCarsState extends State<RecommendedCars> {
  final List<Cars> getCarsList = [];
  var featuredCarsArr = [];
  final url = 'https://car-management-app-university.herokuapp.com';

  Dio dio = new Dio();

  String userId = '';

  Future<void> getUserId() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var user = prefs.getString('user');
    setState(() {
      if (user != null) {
        userId = user as String;
      }
    });
  }

  Future<void> fetchRecommend() async {
    try {
      var recCars = await dio.get('$url/cars/recommanded');

      List cars = recCars.data["cars"];
      setState(() {
        cars.forEach((element) {
          List fav = element['fav'];
          getCarsList.add(Cars(
              id: element['id'],
              description: element["description"],
              title: element["vehicleName"],
              price: element["price"],
              year: element["year"],
              fav: fav,
              transmission: element['transmission'],
              fuelType: element['fuelType'],
              seats: element['seats'],
              ac: element['ac'],
              image: "assets/images/ferrari_spider_488_0.png"));
        });
      });
    } catch (e) {
      throw e;
    }
  }

  Future<void> makeCarFav(id) async {
    var data = {"userId": userId, "carId": id};
    try {
      var recCars = await dio.post('$url/cars/make-fav', data: data);

      setState(() {
        var findCar = getCarsList.firstWhere((element) => element.id == id);
        if (findCar.fav.contains(userId)) {
          findCar.fav.remove(userId);
        } else {
          findCar.fav.add(userId);
        }
      });
    } catch (e) {
      throw e;
    }
  }

  @override
  void initState() {
    fetchRecommend();
    super.initState();
    getUserId();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: getCarsList.map((car) {
          return Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                          title: car.title,
                          id: car.id,
                          price: car.price,
                          year: car.year,
                          description: car.description.toString(),
                          transmission: car.transmission,
                          seats: car.seats,
                          fuelType: car.fuelType,
                          fav: car.fav,
                          ac: car.ac),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(50),
                hoverColor: kPrimaryColor,
                child: Container(
                  margin: EdgeInsets.only(
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    top: size.width * 0.02,
                    bottom: size.width * 0.02,
                  ),
                  width: size.width * 0.5,
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: AssetImage(car.image.toString()),
                            //fit: BoxFit.cover,
                          ),
                        ),
                        height: size.height * 0.2,
                        width: size.width * 0.5,
                      ),
                      //Image.asset(tx.image.toString()),
                      Container(
                        padding: EdgeInsets.only(
                          left: size.width * 0.02,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 10),
                              blurRadius: 50,
                              color: kPrimaryColor.withOpacity(0.23),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  car.title.toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Rs " + car.price.toString(),
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                makeCarFav(car.id);
                              },
                              icon: Icon(
                                Icons.favorite_rounded,
                                color: car.fav.contains(userId)
                                    ? Colors.red
                                    : Colors.grey,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
