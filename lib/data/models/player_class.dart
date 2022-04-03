class PlayerClass {
  late String index;
  late String name;
  late bool selected;
  late bool isDead;
  late int atk;
  late int hp;

  PlayerClass.fromJson(Map<String, dynamic> json){
    index = json['index'];
    name = json['name'];
    selected = false;
    isDead = false;
  }
}