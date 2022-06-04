import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_test/bloc/base_bloc.dart';
import 'package:demo_test/model/client.dart';
import 'package:demo_test/model/clinic.dart';
import 'package:demo_test/service/home_api.dart';
import 'package:rxdart/subjects.dart';

class HomeBloC extends BaseBloC {
  final HomeApi homeApi;
  HomeBloC(this.homeApi);

  var _clinicsObject = BehaviorSubject<List<Clinic>>.seeded([]);
  Stream<List<Clinic>> get clinicsStream => _clinicsObject.stream;

  var _userInformationObject = BehaviorSubject<Client>();
  Stream<Client> get userInformationStream => _userInformationObject.stream;

  DocumentSnapshot? lastDoc;

  int page = 1;
  bool isLoadFull = false;
  final int _limit = 5;

  Future<List<Clinic>> getClinics({bool loadmore = false}) async {
    if (isLoadFull) {
      return _clinicsObject.value;
    }

    if (!loadmore) {
      showLoading();
    } else {
      page++;
    }

    return homeApi
        .getClinics(limit: _limit, lastDoc: lastDoc)
        .then((snapshots) {
      hideLoading();
      lastDoc = snapshots.last;

      List<Clinic> allClinics = _clinicsObject.value;
      List<Clinic> newClinics = snapshots
          .map<Clinic>(
              (e) => Clinic.fromJson(e.data()! as Map<String, dynamic>, e.id))
          .toList();

      allClinics.addAll(newClinics);
      _clinicsObject.add(allClinics);

      return allClinics;
    }).catchError((error) {
      hideLoading();
      throw Exception(error);
    });
  }

  Future getUserInfor() async {
    return await homeApi.getUserInfor().then((client) {
      if (client != null) _userInformationObject.add(client);
    });
  }

  Future<Clinic> getClinicInformation(String clinicId) async {
    return await homeApi.getClinicInformation(clinicId);
  }

  @override
  void dispose() {
    _clinicsObject.close();
    _userInformationObject.close();
    super.dispose();
  }
}
