import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/infrastructure/provider/registration_provider.dart';
import 'package:pet_adoption_app/pet_data_tile_new.dart';

class PetDataNew extends ConsumerStatefulWidget {
  const PetDataNew({super.key});

  @override
  ConsumerState<PetDataNew> createState() => _PetDataNewState();
}

class _PetDataNewState extends ConsumerState<PetDataNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
        ),
        body: ListView.builder(
            itemCount: ref.read(homeProvider).students.length,
            itemBuilder: (BuildContext context, i) {
              return Column(
                children: [
                  Image.asset(ref.read(homeProvider).students[i].image),
                  Text(ref.read(homeProvider).students[i].name),
                  ElevatedButton(
                      onPressed: () {
                        if (ref.read(homeProvider).historyData[i] == true) {
                          ref.read(homeProvider).historyData[i] = false;
                        } else {
                          ref.read(homeProvider).adoptedPet.add(ref.read(homeProvider).students[i]);
                          // historyData[i] = true;
                        }
                        print(ref.read(homeProvider).adoptedPet);
                        // inspect(adoptedPet);
                        print("adopted");
                      },
                      child: Text("Adopted"))
                ],
              );
            }));
  }
}
