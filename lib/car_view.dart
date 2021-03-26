import 'package:flutter/material.dart';
import 'package:jwm/format/infomation.dart';
import 'car_tile.dart';
import 'format/selled_car.dart';
import 'format/selling_car.dart';

class CarView extends StatefulWidget {
  Information info;
  CarView({this.info});

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
        onPressed: () {},
      ),
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
        onPressed: () {},
      ),
      title: Text(
        _total_selled_no.toString() + '대',
      ),
      actions: [
        IconButton(icon: Icon(Icons.category_outlined), onPressed: () {}),
        IconButton(icon: Icon(Icons.sort), onPressed: () {}),
      ],
    ));
    appbar_list.add(AppBar(
      centerTitle: true,
      title: Text(
        '마이페이지',
      ),
    ));
    content_list.add(ListView.builder(
        // padding: const EdgeInsets.all(10),
        padding: EdgeInsets.zero,
        itemCount: _total_selling_no,
        itemBuilder: (BuildContext context, int index) {
          return SellingCarTile(selling_car_list[index]);
        }));
    content_list.add(ListView.builder(
        // padding: EdgeInsets.all(2),
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
}
