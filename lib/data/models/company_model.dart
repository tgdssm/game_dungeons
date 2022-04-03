import 'package:dungeons_and_dragons/data/models/problem_model.dart';

class Company {
  final String name;
  final List<Problem> problems;

  Company({required this.name, this.problems = const []});
}
