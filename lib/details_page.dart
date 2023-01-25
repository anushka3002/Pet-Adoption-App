import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption_app/infrastructure/provider/registration_provider.dart';
import 'package:pet_adoption_app/pet_data_tile_new.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsPage extends ConsumerStatefulWidget {
  final pet_details;
  var pet_history;

  DetailsPage({super.key, required PetDataNewTile this.pet_details, required this.pet_history});

  @override
  ConsumerState<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends ConsumerState<DetailsPage> {
  bool isPlaying = false;
  late ConfettiController controller;
  @override
  void initState() {
    super.initState();
    controller = ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Scaffold(
          appBar: AppBar(
            title: const Text("Welcome"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(widget.pet_details.image),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.pet_details.name,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
              ),
              const SizedBox(height: 20),
              Text(
                widget.pet_details.price,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
              ),
              const SizedBox(height: 20),
              Text(
                widget.pet_details.age,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: ElevatedButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text("You’ve now adopted ${widget.pet_details.name}"),
                  // content: const Text("You have raised a Alert Dialog Box"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Center(
                        child: Container(
                          color: Color.fromARGB(255, 204, 150, 222),
                          padding: const EdgeInsets.all(14),
                          child: const Text(
                            "okay",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
              if (ref.read(homeProvider).historyData[widget.pet_history] == true) {
                widget.pet_history = false;
              } else {
                ref.read(homeProvider).historyData[widget.pet_history] = true;
                ref.read(homeProvider).adoptedPet.add(widget.pet_details);
                final SharedPreferences _pref = await SharedPreferences.getInstance();
                await _pref.setString("adoptedPets", widget.pet_details);
              }
            },
            child: const Text("Adopted me"),
          )
          // ConfettiWidget(
          //   confettiController: controller,
          //   shouldLoop: true,
          //   blastDirection: pi,
          //   particleDrag: 0.05,
          //   emissionFrequency: 0.05,
          //   numberOfParticles: 20,
          //   gravity: 0.05,
          //   colors: const [Colors.orange, Colors.yellow, Colors.pink],
          //   // blastDirection:,
          // )
          )
    ]);
  }
}
