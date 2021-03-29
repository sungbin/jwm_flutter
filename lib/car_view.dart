import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jwm/format/infomation.dart';
import 'car_tile.dart';
import 'format/selled_car.dart';
import 'format/selling_car.dart';
import 'package:geolocator/geolocator.dart';

class CarView extends StatefulWidget {
  Information info;
  CarView(Information info) {
    this.info = info;
  }

  _CarViewState createState() => _CarViewState();
}

class _CarViewState extends State<CarView> {
  List<String> _user_list;
  List<AppBar> appbar_list = [];
  List<Widget> content_list = [];
  List<SellingCar> selling_car_list = [];
  List<SelledCar> selled_car_list = [];
  Information _info;
  int _total_selling_no = 0;
  int _total_selled_no = 0;
  int _selectedIndex = 0;

  void initState() {
    super.initState();
    _info = widget.info;
    _user_list = List<String>.from(_info.user.keys);
    for (String _user in _user_list) {
      selling_car_list.addAll(_info.user[_user].selling_car_list);
      selled_car_list.addAll(_info.user[_user].selled_car_list);
    }
    _total_selling_no = 0;
    _total_selled_no = 0;
    for (String _user in _user_list) {
      _total_selling_no += _info.user[_user].selling_car_list.length;
      _total_selled_no += _info.user[_user].selled_car_list.length;
    }
    appbar_list.add(AppBar(
      centerTitle: true,
      leading: IconButton(
          icon: Icon(Icons.info),
          onPressed: () {
            infoDialog(context);
          }),
      title: Text(
        _total_selling_no.toString() + '대',
      ),
      actions: [
        IconButton(icon: Icon(Icons.category_outlined), onPressed: () {}),
        IconButton(icon: Icon(Icons.sort), onPressed: () {}),
      ],
    ));
    appbar_list.add(AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.info),
        onPressed: () {
          infoDialog(context);
        },
      ),
      title: Text(
        _total_selled_no.toString() + '대',
      ),
    ));
    appbar_list.add(AppBar(
      centerTitle: true,
      title: Text(
        '마이페이지',
      ),
    ));
    content_list.add(ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: _total_selling_no,
        itemBuilder: (BuildContext context, int index) {
          return SellingCarTile(selling_car_list[index]);
        }));
    content_list.add(ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: _total_selled_no,
        itemBuilder: (BuildContext context, int index) {
          return SelledCarTile(selled_car_list[index]);
        }));
    content_list.add(Text('MyPage'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar_list[_selectedIndex],
      body: content_list[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black87.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex, //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text('판매'),
            icon: Icon(Icons.car_rental),
          ),
          BottomNavigationBarItem(
            title: Text('후기'),
            icon: Icon(Icons.hearing),
          ),
          BottomNavigationBarItem(
            title: Text('마이페이지'),
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }

  infoDialog(context) {
    // log('info Dialog: ' + _selectedIndex.toString());
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: <Widget>[
                new Text(
                  "찾아오시는 길",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "회사명: 정원모터스",
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      "연락처: 054-446-4446",
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      "주소: 대구광역시 동구 반야월로 327",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapSample()));
                      }, // handle your image tap here
                      child: Image.asset(
                        'asset/jwm_location.png',
                        fit: BoxFit.cover, // this is the solution for border
                        // width: 110.0,
                        // height: 110.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  "(각산역 1번 출구에서480m)",
                  style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                ),
                // MapSample(),
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text("확인"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _markers = <Marker>[];

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(35.87206496584286, 128.72439087050742),
    zoom: 15.4746,
  );

  @override
  Widget build(BuildContext context) {
    _markers.add(Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(35.87206496584286, 128.72439087050742),
        infoWindow: InfoWindow(title: '정원모터스[대구광역시 동구 신서동 반야월로 327]')));
    return new Scaffold(
      body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(_markers),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          }),
    );
  }
}
