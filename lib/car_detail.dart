import 'package:flutter/material.dart';

import 'format/selled_car.dart';
import 'format/selling_car.dart';

class CarDetail extends StatelessWidget {
  CarDetail(SellingCar car_info) {
    this._car_info = car_info;
  }
  SellingCar _car_info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Hero(
          tag: _car_info.img,
          child: Image.network(
              _car_info.img.substring(0, _car_info.img.indexOf('impolicy'))),
        ),
      ),
    );
  }
}
