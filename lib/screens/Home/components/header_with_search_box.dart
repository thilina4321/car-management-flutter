import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dropdown_search/dropdown_search.dart';

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
                Image.asset("assets/logo/logo.png"),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: DropdownSearch<MultiLevelString>(
                key: myKey,
                items: myItems,
                compareFn: (i1, i2) => i1.level1 == i2.level1,
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                  interceptCallBacks: true,
                  itemBuilder: (ctx, item, isSelected) {
                    return ListTile(
                      selected: isSelected,
                      title: Text(item.level1),
                      trailing: item.subLevel.isEmpty
                          ? null
                          : (item.isExpanded
                              ? IconButton(
                                  icon: Icon(Icons.arrow_drop_down),
                                  onPressed: () {
                                    item.isExpanded = !item.isExpanded;
                                    myKey.currentState?.updatePopupState();
                                  },
                                )
                              : IconButton(
                                  icon: Icon(Icons.arrow_right),
                                  onPressed: () {
                                    item.isExpanded = !item.isExpanded;
                                    myKey.currentState?.updatePopupState();
                                  },
                                )),
                      subtitle: item.subLevel.isNotEmpty && item.isExpanded
                          ? Container(
                              height: item.subLevel.length * 50,
                              child: ListView(
                                children: item.subLevel
                                    .map(
                                      (e) => ListTile(
                                        selected: myKey.currentState
                                                ?.getSelectedItem?.level1 ==
                                            e.level1,
                                        title: Text(e.level1),
                                        onTap: () {
                                          myKey.currentState
                                              ?.popupValidate([e]);
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                            )
                          : null,
                      onTap: () {
                        myKey.currentState?.popupValidate([item]);

                        var car = getCarsList.firstWhere((element) =>
                            element.title.toString() == item.toString());
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
                    );
                  },
                ),
              ),
            ),
            // Container(
            //   alignment: Alignment.center,
            //   margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            //   padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            //   height: 54,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(20),
            //     boxShadow: [
            //       BoxShadow(
            //         offset: const Offset(0, 10),
            //         blurRadius: 50,
            //         color: kPrimaryColor.withOpacity(0.23),
            //       ),
            //     ],
            //   ),
            //   child: Row(
            //     children: <Widget>[
            //       Expanded(
            //         child: TextField(
            //           onChanged: (value) {},
            //           decoration: InputDecoration(
            //             hintText: "Search",
            //             hintStyle: TextStyle(
            //               color: kPrimaryColor.withOpacity(0.5),
            //             ),
            //             enabledBorder: InputBorder.none,
            //             focusedBorder: InputBorder.none,
            //             // surffix isn't working properly  with SVG
            //             // thats why we use row
            //             // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
            //           ),
            //         ),
            //       ),
            //       SvgPicture.asset("assets/icons/search.svg"),
            //     ],
            //   ),
            // ),
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
