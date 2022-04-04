import 'package:hive/hive.dart';

part 'User.g.dart';

@HiveType(typeId: 1)
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