import 'package:flutter/material.dart';

class PetData extends ChangeNotifier {
  final List _petData = [
    ["Dog", "19", '130', "assets/images/dog.jpeg", false],
    ["Cat", "20", '140', "assets/images/cat.jpeg", false],
    ["Rabbit", "18", '200', "assets/images/rabbit.jpeg", false],
    ["Duck", "18", '120', "assets/images/duck.jpeg", false],
    ["Fish", "19", '130', "assets/images/fish.jpeg", false],
    ["Dog2", "24", '130', "assets/images/dog2.jpeg", false],
    ["Parrot", "21", '130', "assets/images/parrot.jpeg", false],
    ["Pegion", "18", '130', "assets/images/pegion.jpeg", false],
    ["Dog3", "20", '130', "assets/images/dog3.jpeg", false],
    ["Tortoise", "26", '130', "assets/images/tortoise.jpeg", false],
  ];

  get petData => _petData;
}
