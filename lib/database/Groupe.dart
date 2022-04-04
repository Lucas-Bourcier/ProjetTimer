import 'package:hive/hive.dart';

part 'Groupe.g.dart';

@HiveType(typeId: 2)
class Groupe{
  @HiveField(0)
  String libelle;

  Groupe({
    required this.libelle,
  });
}