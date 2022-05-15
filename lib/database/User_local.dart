import 'package:hive/hive.dart';

part 'User_local.g.dart';

@HiveType(typeId: 4)
class User{
  @HiveField(0)
  String mail;
  @HiveField(1)
  String pass;

  User({
    required this.mail,
    required this.pass,
  });
}