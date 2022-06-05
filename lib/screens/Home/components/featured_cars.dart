import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../components/constants.dart';
import '../../../components/vehicle_data.dart';
import './/screens/VehicleDetails/details_screen.dart';

class FeaturedCars extends StatefulWidget {
  @override
  State<FeaturedCars> createState() => _FeaturedCarsState();
}

class _FeaturedCarsState extends State<FeaturedCars> {
  final List<Cars> getCarsList = [
    // Cars(
    //   title: "Acura",
    //   price: 44000,
    //   image: "assets/images/acura_0.png",
    //   //pressAction: () {},
    // ),
    // Cars(
    //   title: "Land Rover",
    //   price: 70000,
    //   image: "assets/images/land_rover_0.png",
    //   //pressAction: () {},
    // ),
    // Cars(
    //   title: "Nissan GTR",
    //   price: 60000,
    //   image: "assets/images/nissan_gtr_0.png",
    //   //pressAction: () {},
    // ),
  ];

  var featuredCarsArr = [];

  final url = 'https://car-management-app-university.herokuapp.com';

  Dio dio = new Dio();
  Future<void> fetchFeatured() async {
    try {
      var recCars = await dio.get('$url/cars/available');

      List cars = recCars.data["cars"];
      setState(() {
        cars.forEach((element) {
          List fav = element['fav'];
          
          getCarsList.add(Cars(
              id: element['id'],
              title: element["vehicleName"],
              description: element["description"],
              price: element["price"],
              year: element["year"],
              transmission: element['transmission'],
              fuelType: element['fuelType'],
              seats: element['seats'],
              ac: element['ac'],
              fav: fav,
              image: "assets/images/ferrari_spider_488_0.png"));
        });
      });
    } catch (e) {
      throw e;
    }
  }

  @override
  void initState() {
    fetchFeatured();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: featuredCarsArr.map((tx) {
          return Row(
            children: <Widget>[
              FeaturedCarCard(
                image: tx.image,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        title: tx.title,
                        id: tx.id,
                        price: tx.price,
                        year: tx.year,
                        description: tx.description,
                        transmission: "",
                        seats: "",
                        fuelType: "",
                        ac: "",
                        fav: tx.fav,
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class FeaturedCarCard extends StatelessWidget {
  final String image;
  final VoidCallback press;

  FeaturedCarCard({
    required this.image,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Positioned(
              child: Container(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_rounded,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
        margin: const EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding * 2,
        ),
        width: size.width * 0.55,
        height: size.height * 0.30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            //fit: BoxFit.cover,
            image: AssetImage(image),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 30,
              color: kPrimaryColor.withOpacity(0.15),
            ),
          ],
        ),
      ),
    );
  }
}
