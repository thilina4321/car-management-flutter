import 'package:flutter/material.dart';

import '../../../components/constants.dart';
import '../../AvailableCars/available_cars_screen.dart';

class TitleOfAvailableCars extends StatelessWidget {
  const TitleOfAvailableCars({Key? key}) : super(key: key);

  // final String title;
  // final VoidCallback press;

  // AvailableCarsTitleCard({
  //   required this.title,
  //   required this.press,
  // });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.12,
      width: size.width * 0.9,
      margin: EdgeInsets.only(
        top: size.width * 0.02,
        bottom: size.width * 0.04,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(25),
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
              Container(
                padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  top: size.width * 0.02,
                  bottom: size.width * 0.01,
                ),
                child: const Text(
                  "Available Cars",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              SafeArea(
                child: Container(
                  padding: EdgeInsets.only(
                    left: size.width * 0.05,
                  ),
                  child: const Text(
                    "Long Term and short Term",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AvailableCarsScreen(),
                ),
              );
            },
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    right: kDefaultPadding,
                  ),
                  height: size.height * 0.06,
                  width: size.width * 0.12,
                  padding: const EdgeInsets.all(
                    kDefaultPadding,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                Positioned(
                  right: size.width * 0.015,
                  top: size.width * -0.034,
                  // right: 7,
                  // top: -12,
                  child: Container(
                    padding: const EdgeInsets.all(
                      kDefaultPadding,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: kPrimaryColor,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
