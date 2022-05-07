import 'package:flutter/material.dart';

import 'components/featured_cars.dart';
import 'components/header_with_search_box.dart';
import 'components/recommended_cars.dart';
import 'components/title_of_available_cars.dart';
import 'components/title_of_featured_cars.dart';
import 'components/title_of_recommended_cars.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        HeaderWithSearchBox(size: size),
        Expanded(
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return Column(
                children: [
                  TitleOfAvailableCars(),
                  TitleOfRecommendedCars(title: "Recomended", press: () {}),
                  RecommendedCars(),
                  TitleOfFeaturedCars(title: "Featured Cars", press: () {}),
                  FeaturedCars(),
                ],
              );
            },
            itemCount: 1,
          ),
        ),
      ],
    );
  }
}
