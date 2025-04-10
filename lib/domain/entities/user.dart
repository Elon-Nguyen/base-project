import 'package:base_project/domain/entities/address.dart';
import 'package:base_project/domain/entities/company.dart';

class User {
  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    username = json['username'] as String;
    email = json['email'] as String;
    address =
        json['address'] != null
            ? Address.fromJson(json['address'] as Map<String, dynamic>)
            : null;
    phone = json['phone'] as String;
    website = json['website'] as String;
    company =
        json['company'] != null
            ? Company.fromJson(json['company'] as Map<String, dynamic>)
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['phone'] = phone;
    data['website'] = website;
    if (company != null) {
      data['company'] = company!.toJson();
    }
    return data;
  }
}
