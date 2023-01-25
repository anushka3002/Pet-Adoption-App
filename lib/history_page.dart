import 'package:flutter/material.dart';
import 'package:pet_adoption_app/infrastructure/provider/homeProvider/homeProvider.dart';
import 'package:pet_adoption_app/infrastructure/provider/registration_provider.dart';
import 'package:pet_adoption_app/pet_data_tile_new.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Column(children: [
        Text("Pets Adopted", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Expanded(
            child: ListView.builder(
                itemCount: ref.read(homeProvider).adoptedPet.length,
                itemBuilder: (BuildContext context, i) {
                  return Row(
                    children: [
                      Image.asset(
                        ref.read(homeProvider).adoptedPet[i].image,
                        width: 200,
                        height: 150,
                      ),
                      Text(ref.read(homeProvider).adoptedPet[i].name),
                    ],
                  );
                })),
      ]),
    );
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();
    var getPets = prefs.getString("adoptedPets");
    ref.read(homeProvider).adoptedPet = getPets as List<PetDataNewTile>;
  }
}
