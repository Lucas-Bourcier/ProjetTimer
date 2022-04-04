import 'package:hive/hive.dart';

part 'Trame.g.dart';

@HiveType(typeId: 4)
class Trame{
  @HiveField(0)
  String name;

  Trame({
    required this.name,
  });
}