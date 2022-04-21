import 'package:hive/hive.dart';

part 'Timer_local.g.dart';

@HiveType(typeId: 6)
class Timer {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late int duree;
  @HiveField(2)
  late String description;
  @HiveField(3)
  late bool statut;
  @HiveField(4)
  late bool visible;
  @HiveField(5)
  late int ordre;
  @HiveField(6)
  late DateTime activationDate;
}
