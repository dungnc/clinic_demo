import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class Clinic {
  late String id;
  String? name;
  double? lat;
  double? long;
  String? address;
  late int distance;

  Clinic({
    required this.id,
    this.name,
    this.lat,
    this.long,
    this.address,
    required this.distance,
  });
  Clinic.fromJson(Map<String, dynamic> json, String key) {
    id = key;
    name = json['name']?.toString();
    address = json['address']?.toString();
    distance = Random().nextInt(5) + 1;
    var geopoint = json['geopoint'];
    if (geopoint != null && geopoint is GeoPoint) {
      lat = geopoint.latitude;
      long = geopoint.longitude;
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    data['geopoint'] = GeoPoint(lat ?? 0, long ?? 0);
    return data;
  }
}
