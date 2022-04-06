import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'Groupe.g.dart';

@JsonSerializable()
class Groupe {
  Groupe({
    required this.libelle,
  });

  factory Groupe.fromJson(Map<String, Object?> json) => _$GroupeFromJson(json);

  final String libelle;

  Map<String, Object?> toJson() => _$GroupeToJson(this);

  @override
  String toString(){
    return "libelle : $libelle";
  }
}

@Collection<Groupe>('/Groupe/')
final groupesRef = GroupeCollectionReference();