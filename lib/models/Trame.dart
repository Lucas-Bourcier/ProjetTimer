import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'Trame.g.dart';

@JsonSerializable()
class Trame {
  Trame({
    required this.name,
  });

  factory Trame.fromJson(Map<String, Object?> json) => _$TrameFromJson(json);

  final String name;

  Map<String, Object?> toJson() => _$TrameToJson(this);

  @override
  String toString(){
    return "name : $name";
  }
}

@Collection<Trame>('/Trame/')
final tramesRef = TrameCollectionReference();