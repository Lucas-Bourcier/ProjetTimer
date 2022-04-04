import 'dart:ffi';

import 'package:hive/hive.dart';

part 'Timer.g.dart';

@HiveType(typeId: 3)
class Timer{
  @HiveField(0)

  int duree;
  String description;
  String statut;
  Bool visible;
  int ordre;
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