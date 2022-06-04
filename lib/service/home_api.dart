import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_test/model/client.dart';
import 'package:demo_test/model/clinic.dart';

abstract class HomeApi {
  Future<List<DocumentSnapshot>> getClinics(
      {int limit = 5, DocumentSnapshot? lastDoc});

  Future<Client?> getUserInfor();

  Future<Clinic> getClinicInformation(String clinicId);
}
