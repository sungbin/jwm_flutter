import 'dart:convert';
import 'dart:developer';

import 'package:jwm/format/selled_car.dart';
import 'package:jwm/format/selling_car.dart';

class Seller {
  List<SellingCar> selling_car_list;
  List<SelledCar> selled_car_list;
  Seller() {
    selling_car_list = [];
    selled_car_list = [];
  }
}

class Information {
  Information(String data_json) {
    var data = json.decode(data_json);
    for (var one in data) {
      String user_name = one['user'];
      this.user[user_name] = Seller();
      for (var selled_car in one['selled_car_list']) {
        this.user[user_name].selled_car_list.add(SelledCar.fromMap(selled_car));
      }
      for (Map selling_car in one['selling_car_list']) {
        this
            .user[user_name]
            .selling_car_list
            .add(SellingCar.fromMap(selling_car));
      }
    }
  }

  Map<String, Seller> user = Map<String, Seller>();
}
