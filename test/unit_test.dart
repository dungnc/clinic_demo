import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';
import 'package:demo_test/bloc/home_bloc.dart';
import 'package:demo_test/service/imp/home_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

void main() {
  final instance = FakeFirebaseFirestore();

  late HomeBloC homeBloC = HomeBloC(HomeService(instance));

  setUp(() async {
    await instance.collection('clinics').add({
      'name': 'Massachusetts Clinic',
      'address': '813 Kinney Street, Longmeadow, MA',
      'geopoint': const GeoPoint(0, 0)
    });
    await instance.collection('clinics').add({
      'name': 'Massachusetts Clinic',
      'address': '813 Kinney Street, Longmeadow, MA',
      'geopoint': const GeoPoint(0, 0)
    });
    await instance.collection('clinics').add({
      'name': 'Tak Clinic',
      'address': '3597 Veltri Drive, Halibut Cove, AK',
      'geopoint': const GeoPoint(16.738099, 99.125532)
    });
  });

  tearDown(() {
    homeBloC.dispose();
  });

  group('HomeBloC', () {
    test('Get clinics', () async {
      await homeBloC.getClinics();

      print('------${homeBloC.clinics.length}');

      expect(homeBloC.clinics, isNotNull);
      expect(homeBloC.clinics, isNotEmpty);
    });
  });
}
