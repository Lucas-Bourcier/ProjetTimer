import 'package:hive/hive.dart';

part 'User_local.g.dart';

@HiveType(typeId: 4)
class User{
  @HiveField(0)
  String name;
  @HiveField(1)
  String prenom;

  User({
    required this.name,
    required this.prenom,
  });
}