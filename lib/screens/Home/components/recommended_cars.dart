import 'package:flutter/material.dart';

import '../../../components/constants.dart';
import '../../../components/vehicle_data.dart';
import './/screens/VehicleDetails/details_screen.dart';

class RecommendedCars extends StatelessWidget {
  final List<Cars> getCarsList = [
    Cars(
      title: "Camaro",
      price: 80000,
      image: "assets/images/camaro_0.png",
      //pressAction: () {},
    ),
    Cars(
      title: "Ferrari 488",
      price: 200000,
      image: "assets/images/ferrari_spider_488_0.png",
      //pressAction: () {},
    ),
    Cars(
      title: "Nissan GTR",
      price: 60000,
      image: "assets/images/nissan_gtr_0.png",
      //pressAction: () {},
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: getCarsList.map((tx) {
          return Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(),
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
                            image: AssetImage(tx.image.toString()),
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
                                  tx.title.toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Rs " + tx.price.toString(),
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_rounded,
                                color: Colors.red,
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
