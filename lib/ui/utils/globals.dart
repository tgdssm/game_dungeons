import 'dart:developer' as dev;
import 'dart:math';

import 'package:dungeons_and_dragons/data/models/level_enum.dart';
import 'package:dungeons_and_dragons/data/models/monster.dart';
import 'package:dungeons_and_dragons/data/models/problem_model.dart';
import 'package:dungeons_and_dragons/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../data/models/player_class.dart';

const PRIMARY_COLOR = Color(0xffA34A9B);

List<Map<String, dynamic>> baseClasses = [
  {
    'bar': 'business man',
    'class': 'barbarian',
    'hp': 48,
    'atk': 1,
    'image': "assets/chars/char1.png"
  },
  {
    'bar': 'redator',
    'class': 'bard',
    'hp': 40,
    'atk': 1,
    'image': "assets/chars/char2.png"
  },
  {
    'bar': 'gerente de projetos',
    'class': 'cleric',
    'hp': 32,
    'atk': 1,
    'image': "assets/chars/char3.png"
  },
  {
    'bar': 'tech lead',
    'class': 'druid',
    'hp': 32,
    'atk': 2,
    'image': "assets/chars/char4.png"
  },
  {
    'bar': 'devops',
    'class': 'fighter',
    'hp': 40,
    'atk': 2,
    'image': "assets/chars/char5.png"
  },
  {
    'bar': 'engenheiro de software',
    'class': 'monk',
    'hp': 32,
    'atk': 2,
    'image': "assets/chars/char6.png"
  },
  {
    'bar': 'designer',
    'class': 'paladin',
    'hp': 40,
    'atk': 3,
    'image': "assets/chars/char7.png"
  },
  {
    'bar': 'comercial',
    'class': 'ranger',
    'hp': 40,
    'atk': 3,
    'image': "assets/chars/char8.png"
  },
  {
    'bar': 'dev',
    'class': 'rogue',
    'hp': 32,
    'atk': 2,
    'image': "assets/chars/char9.png"
  },
  {
    'bar': 'auditor',
    'class': 'sorcerer',
    'hp': 18,
    'atk': 3,
    'image': "assets/chars/char10.png"
  },
  {
    'bar': 'suporte',
    'class': 'warlock',
    'hp': 32,
    'atk': 1,
    'image': "assets/chars/char11.png"
  },
  {
    'bar': 'proccess manager',
    'class': 'wizard',
    'hp': 18,
    'atk': 2,
    'image': "assets/chars/char12.png"
  },
];

List<PlayerClass> globalClasses = [];

Monster? currentMonster;

Problem selectProblem(Level level) {
  var problems = companies.first.problems
      .where((element) => element.level == level)
      .toList();

  var index = Random().nextInt(problems.length);

  return problems[index];
}

int turn = 0;

int monsterDice = -1;
int teamDice = -1;

int rollDice() {
  return Random().nextInt(20);
}

List<PlayerClass> players = [];

void damageToPlayers() {
  for (var i = 0; i < players.length; i++) {
    players[i].hp -= currentMonster!.atk;

    if (players[i].hp <= 0) {
      players[i].isDead = true;
    }
  }
}

void damageToBoss() {
  var alivePlayers = players.where((element) => element.isDead).toList();
  alivePlayers.map((e) => currentMonster!.hp -= e.atk);
}

/// -1 - none
/// 1 - monster death
/// 2 - players death
int verifyGame() {
  if (currentMonster!.hp <= 0) {
    dev.log("Monster is Dead");
    return 1;
  }

  int allPlayersAlive = 0;

  for (var player in players) {
    if (player.isDead) {
      allPlayersAlive += 1;
    }
  }

  if (allPlayersAlive == players.length) {
    dev.log("All Players is dead");
    return 2;
  }

  return -1;
}

void fight() {
  if (monsterDice > teamDice) {
    damageToPlayers();
  } else if (monsterDice < teamDice) {
    damageToBoss();
  } else {
    damageToPlayers();
    damageToBoss();
  }

  verifyGame();
}
