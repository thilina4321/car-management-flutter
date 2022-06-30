import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:search_page/search_page.dart';

import '../../../components/constants.dart';
import '../../../components/vehicle_data.dart';
import '../../VehicleDetails/details_screen.dart';

class HeaderWithSearchBox extends StatefulWidget {
  HeaderWithSearchBox({
    required this.size,
  });

  final Size size;

  @override
  State<HeaderWithSearchBox> createState() => _HeaderWithSearchBoxState();
}

class _HeaderWithSearchBoxState extends State<HeaderWithSearchBox> {
  final myKey = GlobalKey<DropdownSearchState<MultiLevelString>>();
  final List<MultiLevelString> myItems = [];
  final url = 'https://car-management-app-university.herokuapp.com';
  final List<Cars> getCarsList = [];

  Dio dio = new Dio();

  Future<void> fetchAvailable() async {
    try {
      var availableCars = await dio.get('$url/cars/available');
      List cars = availableCars.data['cars'];
      setState(() {
        cars.forEach((element) {
          List fav = element['fav'];
          myItems.add(MultiLevelString(level1: element['vehicleName']));
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
    return Container(
      margin: const EdgeInsets.only(
        bottom: kDefaultPadding * 2,
      ),
      // It will cover 20% of our total height
      height: widget.size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 36 + kDefaultPadding,
            ),
            height: widget.size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'DS Rent Cars',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () => showSearch(
                      context: context,
                      delegate: SearchPage<Cars>(
                        items: getCarsList,
                        searchLabel: 'Search cars',
                        suggestion: Center(
                          child: Text('Filter car by name, price'),
                        ),
                        failure: Center(
                          child: Text('No cars founds'),
                        ),
                        filter: (car) => [
                          car.title,
                          car.price.toString(),
                        ],
                        builder: (car) => ListTile(
                          title: Text(car.title),
                          subtitle: Text(car.price.toString()),
                          onTap: (){
                            Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              title: car.title,
                              id: car.id,
                              price: car.price,
                              year: car.year,
                              description: car.description,
                              transmission: car.transmission,
                              seats: car.seats,
                              fuelType: car.fuelType,
                              ac: car.ac,
                              fav: car.fav,
                            ),
                          ),
                        );
                          },
                        ),
                      ),
                    ),
                    color: Colors.white,
                    iconSize: 50,
                    icon: Icon(Icons.search_off_rounded))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MultiLevelString {
  final String level1;
  final List<MultiLevelString> subLevel;
  bool isExpanded;

  MultiLevelString({
    this.level1 = "",
    this.subLevel = const [],
    this.isExpanded = false,
  });

  MultiLevelString copy({
    String? level1,
    List<MultiLevelString>? subLevel,
    bool? isExpanded,
  }) =>
      MultiLevelString(
        level1: level1 ?? this.level1,
        subLevel: subLevel ?? this.subLevel,
        isExpanded: isExpanded ?? this.isExpanded,
      );

  @override
  String toString() => level1;
}
