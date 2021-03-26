import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'format/selled_car.dart';
import 'format/selling_car.dart';

class SellingCarTile extends StatelessWidget {
  // ignore: non_constant_identifier_names
  SellingCarTile(SellingCar car_info) {
    this._car_info = car_info;
  }
  SellingCar _car_info;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(3, 5, 3, 5),
        child: Card(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              _car_info.img.substring(0, _car_info.img.indexOf('impolicy')),
              height: 120,
              width: 170,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _car_info.kind1 + ': ' + _car_info.kind2,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 5),
                  Text(
                    _car_info.year + ' ' + _car_info.distance,
                    style: TextStyle(fontSize: 11, color: Colors.black54),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 5),
                  Text(
                    _car_info.price,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}

class SelledCarTile extends StatelessWidget {
  // ignore: non_constant_identifier_names
  SelledCarTile(SelledCar car_info) {
    this._car_info = car_info;
  }
  SelledCar _car_info;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(3, 5, 3, 5),
        child: Card(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              _car_info.img.substring(0, _car_info.img.indexOf('impolicy')),
              height: 120,
              width: 170,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _car_info.kind1 + ': ' + _car_info.kind2,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 5),
                  Text(
                    _car_info.year + ' ' + _car_info.distance,
                    style: TextStyle(fontSize: 11, color: Colors.black54),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
