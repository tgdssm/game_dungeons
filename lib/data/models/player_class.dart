class PlayerClass {
  late String pClass;
  late String name;
  late bool selected;
  late bool isDead;
  late int atk;
  late int hp;
  late String office;
  late String image;

  PlayerClass.fromJson(Map<String, dynamic> json){
    pClass = json['class'];
    office =  json['bar'];
    atk = json['atk'];
    hp = json['hp'];
    image = json['image'];
    selected = false;
    isDead = false;


  }




}