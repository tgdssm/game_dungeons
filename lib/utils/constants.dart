import 'dart:math';

import 'package:dungeons_and_dragons/data/models/company_model.dart';
import 'package:dungeons_and_dragons/data/models/level_enum.dart';
import 'package:dungeons_and_dragons/data/models/monster.dart';
import 'package:dungeons_and_dragons/data/models/problem_model.dart';

final List<Company> companies = [
  Company(
    name: "Yep",
    problems: [
      Problem("Projeto sem Escopo/Requisitos", Level.low),
      Problem("Projeto sem Documentação", Level.low),
      Problem("Projeto sem Recursos/Orçamento", Level.low),
      Problem("Falta de comunicação interna", Level.low),
      Problem("Projeto sem validação/teste/qualidade", Level.medium),
      Problem(
          "Projeto com tempo de execução curto/sem cronograma", Level.medium),
      Problem("Mindset Fixo", Level.high),
      Problem("Refatoramento de projeto", Level.high),
    ],
  ),
];

final monster = [
  Monster(name: "Black Bear", atk: 15, hp: 19),
  Monster(name: "Camel", atk: 16, hp: 15),
  Monster(name: "Crocodile", atk: 15, hp: 19),
  Monster(name: "Giant Bat", atk: 15, hp: 22),
  Monster(name: "Harpy", atk: 12, hp: 38),
  Monster(name: "Centaur", atk: 18, hp: 45),
  Monster(name: "Archmage", atk: 10, hp: 99),
  Monster(name: "Chimera", atk: 19, hp: 114),
  Monster(name: "Black Dragon - Adult", atk: 23, hp: 195),
];

Monster selectMonster(Problem problem) {
  var random = Random();

  return monster[random.nextInt(monster
      .where((element) => element.level == problem.level)
      .toList()
      .length)];
}
