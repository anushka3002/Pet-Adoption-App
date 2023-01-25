import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/pet_data_tile_new.dart';

class HomeProvider extends ChangeNotifier {
  late ChangeNotifierProviderRef<HomeProvider> ref;
  HomeProvider(this.ref);
  String name = "abc";
  List historyData = [];
  List<PetDataNewTile> adoptedPet = [];
  List<PetDataNewTile> pets = [];
  bool adoptedNow = false;

  startData() {
    pets = [
      PetDataNewTile(
        name: "Dog",
        age: "26",
        price: "120",
        image: "assets/images/dog.jpeg",
      ),
      PetDataNewTile(
        name: "Cat",
        age: "20",
        price: "180",
        image: "assets/images/cat.jpeg",
      ),
      PetDataNewTile(
        name: "Rabbit",
        age: "19",
        price: "110",
        image: "assets/images/rabbit.jpeg",
      ),
      PetDataNewTile(
        name: "Duck",
        age: "17",
        price: "99",
        image: "assets/images/duck.jpeg",
      ),
      PetDataNewTile(
        name: "Fish",
        age: "14",
        price: "10",
        image: "assets/images/fish.jpeg",
      ),
      PetDataNewTile(
        name: "Dog2",
        age: "26",
        price: "50",
        image: "assets/images/dog2.jpeg",
      ),
      PetDataNewTile(
        name: "Parrot",
        age: "22",
        price: "30",
        image: "assets/images/parrot.jpeg",
      ),
      PetDataNewTile(
        name: "Pegion",
        age: "19",
        price: "70",
        image: "assets/images/pegion.jpeg",
      ),
      PetDataNewTile(
        name: "Pug",
        age: "24",
        price: "90",
        image: "assets/images/dog3.jpeg",
      ),
      PetDataNewTile(
        name: "Tortoise",
        age: "20",
        price: "60",
        image: "assets/images/tortoise.jpeg",
      ),
    ];
    for (var _ in (pets ?? [])) {
      historyData.add(false);
    }
  }
}
