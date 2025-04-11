import 'package:base_project/core/domain/entities/geo.dart';

class Address {
  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'] as String;
    suite = json['suite'] as String;
    city = json['city'] as String;
    zipcode = json['zipcode'] as String;
    geo =
        json['geo'] != null
            ? Geo.fromJson(json['geo'] as Map<String, dynamic>)
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['street'] = street;
    data['suite'] = suite;
    data['city'] = city;
    data['zipcode'] = zipcode;
    if (geo != null) {
      data['geo'] = geo!.toJson();
    }
    return data;
  }
}
