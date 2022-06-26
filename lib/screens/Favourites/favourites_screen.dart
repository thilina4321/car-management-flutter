// ignore_for_file: unnecessary_const

import 'package:ds_rent_cars/helper/search-helper.dart';
import 'package:flutter/material.dart';

import './/components/constants.dart';
import 'fav_body.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: size.height * 0.1,
        actions: [
          Container(
            margin: const EdgeInsets.only(
              right: kDefaultPadding / 2,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  margin: const EdgeInsets.all(
                    kDefaultPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Positioned(
                  child: IconButton(
                    onPressed:  () async{
                      try {
                        // var place = await SearchHelper.userSearch(context);
                      } catch (e) {
                      }
                    },
                    icon: const Icon(
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
        title: const Text(
          "My Favourites",
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: kPrimaryColor,
          ),
        ),
        //centerTitle: true,
      ),
      body: const FavBody(),
    );
  }
}
