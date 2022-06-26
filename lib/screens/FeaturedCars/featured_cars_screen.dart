import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

import '../VehicleDetails/details_screen.dart';
import './/components/constants.dart';
import './/components/vehicle_data.dart';
import './/screens/components/vehicle_card_rectangle_box.dart';

class FeaturedCarsScreen extends StatefulWidget {
  @override
  State<FeaturedCarsScreen> createState() => _FeaturedCarsScreenState();
}

class _FeaturedCarsScreenState extends State<FeaturedCarsScreen> {
  final List<Cars> getCarsList = [
    // Cars(
    //   title: "Acura",
    //   price: 44000,
    //   image: "assets/images/acura_0.png",
    //   //pressAction: () {},
    // ),
    // Cars(
    //   title: "Camaro",
    //   price: 80000,
    //   image: "assets/images/camaro_0.png",
    //   //pressAction: () {},
    // ),
    // Cars(
    //   title: "Land Rover",
    //   price: 70000,
    //   image: "assets/images/land_rover_0.png",
    //   //pressAction: () {},
    // ),
    // Cars(
    //   title: "Ferrari 488",
    //   price: 200000,
    //   image: "assets/images/ferrari_spider_488_0.png",
    //   //pressAction: () {},
    // ),
    // Cars(
    //   title: "Nissan GTR",
    //   price: 60000,
    //   image: "assets/images/nissan_gtr_0.png",
    //   //pressAction: () {},
    // ),
  ];

  final url = 'https://car-management-app-university.herokuapp.com';

  Dio dio = new Dio();

  Future<void> fetchFeatured() async {
    try {

      var fetchedDriver = await dio.get('$url/home/brand');
      var driver = fetchedDriver.data;
      
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: size.height * 0.1,
        elevation: 0,
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
                    onPressed: () => showSearch(
                      context: context,
                      delegate: SearchPage<Cars>(
                        items: getCarsList,
                        searchLabel: 'Search cars',
                        suggestion: Center(
                          child: Text('Filter  recommandard car by name, price'),
                        ),
                        failure: Center(
                          child: Text('No cars founds'),
                        ),
                        filter: (car) => [
                          car.title.toString(),
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
                text: 'Featured ',
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
        children: [
          // VehicleCard(),
          // VehicleCard(),
          // VehicleCard(),
          // VehicleCard(),
          // VehicleCard(),
        ],
      ),
    );
  }
}
