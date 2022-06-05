import 'package:dio/dio.dart';
import 'package:ds_rent_cars/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './/screens/components/vehicle_card_square_box.dart';

class FavBody extends StatefulWidget {
  const FavBody({Key? key}) : super(key: key);

  @override
  State<FavBody> createState() => _FavBodyState();
}

class _FavBodyState extends State<FavBody> {
  final url = 'https://car-management-app-university.herokuapp.com';

  List<VehicleCard> getCarsList = [];

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
    fetchFeatured();
  }

  Dio dio = new Dio();
  Future<void> fetchFeatured() async {
    try {
      var recCars = await dio.get('$url/cars/available');

      List cars = recCars.data["cars"];
      setState(() {
        cars.forEach((element) {
          List fav = element['fav'];

          if (fav.contains(userId)) {
            getCarsList.add(VehicleCard(
                id: element['id'],
                title: element["vehicleName"],
                price: element["price"],
                year: element["year"],
                transmission: element['transmission'],
                fuelType: element['fuelType'],
                seats: element['seats'],
                ac: element['ac'],
                description: element['description'],
                fav: fav,
                makeCarFav: (id) => removeCarFav(id),
                image: "assets/images/ferrari_spider_488_0.png"));
          }
        });
      });
    } catch (e) {
      throw e;
    }
  }

  Future<void> removeCarFav(id) async {
    var data = {"userId": userId, "carId": id};
    try {
      await dio.post('$url/cars/make-fav', data: data);
      var findVal = getCarsList.firstWhere((element) => element.id == id);
      setState(() {
        getCarsList.remove(findVal);
      });
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(
        kDefaultPadding / 2,
      ),
      children: getCarsList.map((e) => e).toList(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
