import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  User({
    required this.mail,
    required this.pass,
  });


  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  final String mail;
  final String pass;

  Map<String, Object?> toJson() => _$UserToJson(this);

  @override
  String toString(){
    return "mail : $mail, age: $pass";
  }
}

@Collection<User>('/User/')
final usersRef = UserCollectionReference();