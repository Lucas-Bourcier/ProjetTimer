import 'dart:convert';

import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:project_timer/models/Timer.dart';


Tache timerFromJson(String str) => Tache.fromJson(json.decode(str));

String timerToJson(Tache data) => json.encode(data.toJson());

class Tache {
  Tache({
    required this.name,
    this.description='',
    this.duree=0,
  });

  String name;
  String description;
  int duree;

  factory Tache.fromJson(Map<String, dynamic> json) {
    Tache t=Tache(
        name: json["name"]??'',
        description: json["description"]??'',
        duree: json["duree"]??0
    );
    return t;
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "duree":duree
  };
}
@Collection<Tache>('/Tache/')
final timersRef = TimerCollectionReference();
