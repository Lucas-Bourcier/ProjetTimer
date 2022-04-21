// ne pas toucher ca peut être utile merci

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService(this.uid);

  final CollectionReference<Map<String, dynamic>> timerCollection =
      FirebaseFirestore.instance.collection("Timer");

  Future<void> saveUser(String name, String description, int duree, int ordre,
      bool statut, bool visible, String activationDate) async {
    return await timerCollection.doc(uid).set({
      'name': name,
      'description': description,
      'duree': duree,
      'ordre': ordre,
      'statut': statut,
      'visible': visible,
      'activationDate': activationDate,
    });
  }
}
