import 'dart:io';
import 'package:week_01_dart_demo/person.dart';
import 'package:week_01_dart_demo/week_01_dart_demo.dart';

void main(List<String> arguments) {
  // Initialized variables do not require type
  // const name = 'Sally';
  // final age = calculate();

  String name;
  int age;

  name = prompt('Enter your name: ');
  age = promptInt('Enter your age: ');

  final p = Person(name, age);

  stdout.writeln('Hello ${p.name}, it looks like you are ${p.age} years old.');
}
