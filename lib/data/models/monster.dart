import 'package:dungeons_and_dragons/data/models/level_enum.dart';

class Monster {
  final String name;
  final int atk;
  int hp;
  final Level level;

  Monster(
      {required this.name,
      required this.atk,
      required this.hp,
      this.level = Level.low});

  factory Monster.fromJson(Map<String, dynamic> source) {
    return Monster(
      name: source['name'],
      atk: source['atk'],
      hp: source['hp'],
      level: Level.values.singleWhere(
        (element) => element.name == source['level'],
      ),
    );
  }
}
