class Geo {
  Geo({this.lat, this.lng});

  String? lat;
  String? lng;

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'] as String;
    lng = json['lng'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}
