import 'package:dungeons_and_dragons/data/models/player_class.dart';
import 'package:flutter/material.dart';

const PRIMARY_COLOR = Color(0xffA34A9B);

List<Map<String, dynamic>> baseClasses  = [
  {'bar': 'business man',
    'class': 'barbarian',
    'hp': 48,
    'atk': 1,
    'image': "assets/chars/char1"
  },
  {'bar': 'redator',
    'class': 'bard',
    'hp': 40,
    'atk': 1,
    'image': "assets/chars/char2"
  },
  {'bar': 'gerente de projetos',
    'class': 'cleric',
    'hp': 32,
    'atk': 1,
    'image': "assets/chars/char3"
  },
  {'bar': 'tech lead',
    'class': 'druid',
    'hp': 32,
    'atk': 2,
    'image': "assets/chars/char4"
  },
  {'bar': 'devops',
    'class': 'fighter',
    'hp': 40,
    'atk': 2,
    'image': "assets/chars/char5"
  },
  {'bar': 'engenheiro de software',
    'class': 'monk',
    'hp': 32,
    'atk': 2,
    'image': "assets/chars/char6"
  },
  {'bar': 'designer',
    'class': 'paladin',
    'hp': 40,
    'atk': 3,
    'image': "assets/chars/char7"
  },
  {'bar': 'comercial',
    'class': 'ranger',
    'hp': 40,
    'atk': 3,
    'image': "assets/chars/char8"
  },
  {'bar': 'dev',
    'class': 'rogue',
    'hp': 32,
    'atk': 2,
    'image': "assets/chars/char9"
  },
  {'bar': 'auditor',
    'class': 'sorcerer',
    'hp': 18,
    'atk': 3,
    'image': "assets/chars/char10"
  },
  {'bar': 'suporte',
    'class': 'warlock',
    'hp': 32,
    'atk': 1,
    'image': "assets/chars/char11"
  },
  {'bar': 'proccess manager',
    'class': 'wizard',
    'hp': 18,
    'atk': 2,
    'image': "assets/chars/char12"
  },
];


final result = [{"index": "barbarian"}];


// final classes = result.map<PlayerClass>((e) {
//
// });
