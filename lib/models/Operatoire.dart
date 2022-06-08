import 'dart:convert';

import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:project_timer/models/Timer.dart';


Operatoire timerFromJson(String str) => Operatoire.fromJson(json.decode(str));

String timerToJson(Operatoire data) => json.encode(data.toJson());

class Operatoire {
  Operatoire({
    required this.name,
    this.description='',
    this.nbTache=1,
  });

  String name;
  String description;
  int nbTache;

  factory Operatoire.fromJson(Map<String, dynamic> json) {
    Operatoire t=Operatoire(
      name: json["name"]??'',
      description: json["description"]??'',
     nbTache: json["nbTache"]??''
    );
    return t;
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "nbTache":nbTache
  };
}
@Collection<Operatoire>('/Operatoire/')
final timersRef = TimerCollectionReference();
