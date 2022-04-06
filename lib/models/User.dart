import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

// This doesn't exist yet...! See "Next Steps"
part 'User.g.dart';

@JsonSerializable()
class User {
  User({
    required this.name,
    required this.age,
  });

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  final String name;
  final int age;

  Map<String, Object?> toJson() => _$UserToJson(this);

  @override
  String toString(){
    return "name : $name, age: $age";
  }
}

@Collection<User>('/User/')
final usersRef = UserCollectionReference();