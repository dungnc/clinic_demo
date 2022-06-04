import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_test/model/client.dart';
import 'package:demo_test/model/clinic.dart';
import 'package:demo_test/service/home_api.dart';

class HomeService extends HomeApi {
  var db = FirebaseFirestore.instance;

  @override
  Future<List<DocumentSnapshot>> getClinics(
      {int limit = 5, DocumentSnapshot? lastDoc}) async {
    var query = db.collection('clinics').orderBy('name');
    if (lastDoc != null) {
      query = query.startAfterDocument(lastDoc);
    }
    query = query.limit(limit);
    var resp = await query.get();

    return resp.docs;
  }

  @override
  Future<Client?> getUserInfor() async {
    var query =
        db.collection('clients').doc('Z9JGmigZHU6XEbM9haDE').withConverter(
              fromFirestore: (snapshot, _) => Client.fromJson(snapshot.data()!),
              toFirestore: (Client value, _) => value.toJson(),
            );

    var resp = await query.get();

    return resp.data();
  }

  @override
  Future<Clinic> getClinicInformation(String clinicId) async {
    var query = db.collection('clinics').doc(clinicId).withConverter(
          fromFirestore: (snapshot, _) =>
              Clinic.fromJson(snapshot.data()!, clinicId),
          toFirestore: (Clinic value, _) => value.toJson(),
        );

    var resp = await query.get();

    if (resp.data() == null) {
      throw Exception('$clinicId have no data');
    }

    return resp.data()!;
  }
}
