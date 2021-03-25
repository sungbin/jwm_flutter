import 'dart:convert';

class SellingCar {
  String img;
  String kind1;
  String kind2;
  String auto;
  String fuel;
  String year;
  String distance;
  String price;
  String day;
  String sub_url;
  SellingCar({
    this.img,
    this.kind1,
    this.kind2,
    this.auto,
    this.fuel,
    this.year,
    this.distance,
    this.price,
    this.day,
    this.sub_url,
  });

  SellingCar copyWith({
    String img,
    String kind1,
    String kind2,
    String auto,
    String fuel,
    String year,
    String distance,
    String price,
    String day,
    String sub_url,
  }) {
    return SellingCar(
      img: img ?? this.img,
      kind1: kind1 ?? this.kind1,
      kind2: kind2 ?? this.kind2,
      auto: auto ?? this.auto,
      fuel: fuel ?? this.fuel,
      year: year ?? this.year,
      distance: distance ?? this.distance,
      price: price ?? this.price,
      day: day ?? this.day,
      sub_url: sub_url ?? this.sub_url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'img': img,
      'kind1': kind1,
      'kind2': kind2,
      'auto': auto,
      'fuel': fuel,
      'year': year,
      'distance': distance,
      'price': price,
      'day': day,
      'sub_url': sub_url,
    };
  }

  factory SellingCar.fromMap(Map<String, dynamic> map) {
    return SellingCar(
      img: map['img'],
      kind1: map['kind1'],
      kind2: map['kind2'],
      auto: map['auto'],
      fuel: map['fuel'],
      year: map['year'],
      distance: map['distance'],
      price: map['price'],
      day: map['day'],
      sub_url: map['sub_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SellingCar.fromJson(String source) =>
      SellingCar.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SellingCar(img: $img, kind1: $kind1, kind2: $kind2, auto: $auto, fuel: $fuel, year: $year, distance: $distance, price: $price, day: $day, sub_url: $sub_url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SellingCar &&
        other.img == img &&
        other.kind1 == kind1 &&
        other.kind2 == kind2 &&
        other.auto == auto &&
        other.fuel == fuel &&
        other.year == year &&
        other.distance == distance &&
        other.price == price &&
        other.day == day &&
        other.sub_url == sub_url;
  }

  @override
  int get hashCode {
    return img.hashCode ^
        kind1.hashCode ^
        kind2.hashCode ^
        auto.hashCode ^
        fuel.hashCode ^
        year.hashCode ^
        distance.hashCode ^
        price.hashCode ^
        day.hashCode ^
        sub_url.hashCode;
  }
}
