import 'package:hive/hive.dart';

part 'Trame_local.g.dart';

  @HiveType(typeId: 7)
  class Trame{
    @HiveField(0)
    late String name;
    Trame({
      required this.name,
    });
}