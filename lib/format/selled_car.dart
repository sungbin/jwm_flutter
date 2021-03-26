import 'dart:convert';

class SelledCar {
  String img;
  String kind1;
  String kind2;
  String auto;
  String fuel;
  String year;
  String distance;
  String day;
  SelledCar({
    this.img,
    this.kind1,
    this.kind2,
    this.auto,
    this.fuel,
    this.year,
    this.distance,
    this.day,
  });

  SelledCar copyWith({
    String img,
    String kind1,
    String kind2,
    String auto,
    String fuel,
    String year,
    String distance,
    String day,
  }) {
    return SelledCar(
      img: img ?? this.img,
      kind1: kind1 ?? this.kind1,
      kind2: kind2 ?? this.kind2,
      auto: auto ?? this.auto,
      fuel: fuel ?? this.fuel,
      year: year ?? this.year,
      distance: distance ?? this.distance,
      day: day ?? this.day,
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
      'day': day,
    };
  }

  factory SelledCar.fromMap(Map<String, dynamic> map) {
    return SelledCar(
      img: map['img'],
      kind1: map['kind1'],
      kind2: map['kind2'],
      auto: map['auto'],
      fuel: map['fuel'],
      year: map['year'],
      distance: map['distance'],
      day: map['day'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SelledCar.fromJson(String source) =>
      SelledCar.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SelledCar(img: $img, kind1: $kind1, kind2: $kind2, auto: $auto, fuel: $fuel, year: $year, distance: $distance, day: $day)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SelledCar &&
        other.img == img &&
        other.kind1 == kind1 &&
        other.kind2 == kind2 &&
        other.auto == auto &&
        other.fuel == fuel &&
        other.year == year &&
        other.distance == distance &&
        other.day == day;
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
        day.hashCode;
  }
}
