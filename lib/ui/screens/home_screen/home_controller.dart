import 'package:dungeons_and_dragons/data/models/player_class.dart';
import 'package:dungeons_and_dragons/data/providers/api_requests.dart';
import 'package:flutter/cupertino.dart';

class HomeController {

  List<PlayerClass> classes = [];
  bool isLoading = true;
  ValueNotifier<int> selectedClasses = ValueNotifier(0);
  final scrollController = ScrollController();

  HomeController._internal();
  static final  _singletonHomeController = HomeController._internal();
  factory HomeController() => _singletonHomeController;

  Future<void> readClasses() async {
    classes = await APIRequests.getClasses();
    isLoading = false;
  }

  String nameClass(int index) {
    switch(index) {
      case 0:
        return 'Desenvolvedor';
      case 1:
        return 'Engenheiro de software';
      case 2:
        return 'qualquer coisa $index';
      case 3:
        return 'qualquer coisa $index';
      case 4:
        return 'qualquer coisa $index';
      case 5:
        return 'qualquer coisa $index';
      case 6:
        return 'qualquer coisa $index';
      default:
        return '';
    }
  }
}