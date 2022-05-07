import 'package:flutter/material.dart';

import './/components/constants.dart';

import 'vehicle_info_card.dart';

class VehicleInfoBody extends StatefulWidget {
  @override
  State<VehicleInfoBody> createState() => _VehicleInfoBodyState();
}

class _VehicleInfoBodyState extends State<VehicleInfoBody> {
  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        child: BottomSheetDesign(),
      ),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return VehicleInfoCard(
      vehicleName: "Ferrari 488 Spider",
      year: 2018,
      image: "assets/images/ferrari_spider_488_0.png",
      price: 8000,
      description:
          "The redesigned 2022 MDX houses a 290-HP81 V-6 engine paired to a double-wishbone front suspension for precision cornering. For even more exhilaration, the MDX Type S features an available 355-hp Turbo V6 engine and available air suspension that thrills with every drive. Handling is further enhanced by the Integrated Dynamics System, including a new Lift mode for Type S, while available wider 21-in alloy wheels ensure adrenaline-inducing performance.",
      transmission: "Automatic",
      fuelType: "Fuel",
      seats: "4 Seats",
      ac: "Air Condition",
      showBottomSheet: showBottomSheet,
    );
  }
}

class BottomSheetDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      width: size.width,
      padding: EdgeInsets.only(
        left: size.width * 0.08,
        right: size.width * 0.08,
        top: size.width * 0.1,
        bottom: size.width * 0.04,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ferrari 488 Spider",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "2018",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Rs 8000",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "/ day",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: size.width * 0.08),
          Text(
            "How many days you want?",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          BottomSheetTxtField(
            label: "Days",
            hintTxt: "number of days",
          ),
          Text(
            "When the date you want?",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          BottomSheetTxtField(
            label: "Date",
            hintTxt: "give your date",
          ),
          SizedBox(height: size.width * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Price",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Rs 100000 / day",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              FlatButton(
                color: kLScrnTxtColor1,
                splashColor: kPrimaryColor,
                textColor: Colors.white,
                child: Text(
                  'Confirm the Order',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                minWidth: size.width * 0.25,
                height: size.width * 0.12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomSheetTxtField extends StatelessWidget {
  final String label;
  final String hintTxt;

  BottomSheetTxtField({
    required this.label,
    required this.hintTxt,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        right: size.width * 0.5,
        bottom: size.width * 0.02,
        top: size.width * 0.02,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text(
            label,
            style: TextStyle(
              color: kLScrnTxtColor2,
              fontSize: 20,
            ),
          ),
          hintText: hintTxt,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: kLScrnTxtColor1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: kLScrnTxtColor1,
            ),
          ),
        ),
      ),
    );
  }
}
