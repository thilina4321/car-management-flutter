import 'package:flutter/material.dart';

import 'create_account_screen_body.dart';
import './/components/constants.dart';

class CreateAnAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(),
    );
  }
}
