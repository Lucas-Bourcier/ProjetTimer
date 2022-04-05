import 'dart:ffi';

import 'package:hive/hive.dart';

part 'Timer.g.dart';

@HiveType(typeId: 3)
class Timer{
  @HiveField(0)
  int duree;
  @HiveField(1)
  String description;
  @HiveField(2)
  String statut;
  @HiveField(3)
  Bool visible;
  @HiveField(4)
  int ordre;
  @HiveField(5)
  DateTime dateActivation;

    Timer({
      required this.duree,
      required this.description,
      required this.statut,
      required this.visible,
      required this.ordre,
      required this.dateActivation,
  });
}