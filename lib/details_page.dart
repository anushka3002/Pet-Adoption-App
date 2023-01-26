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
            title: const Text("Pet Details"),
          ),
          body: Container(
            decoration: BoxDecoration(color: Color.fromARGB(255, 144, 189, 225)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(color: Color.fromARGB(255, 200, 219, 251)),
                  child: InteractiveViewer(
                      panEnabled: false, // Set it to false
                      boundaryMargin: EdgeInsets.all(100),
                      minScale: 0.9,
                      maxScale: 2,
                      child: Image.asset(
                        widget.pet_details.image,
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Column(
                        children: [
                          Text(
                            "Hey I am ${widget.pet_details.name},",
                            textAlign: TextAlign.start,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Price: \$${widget.pet_details.price}",
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Age:  ${widget.pet_details.age}",
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ref.watch(homeProvider).historyData[widget.pet_history] == false
                  ? Color.fromARGB(255, 27, 107, 173)
                  : Colors.grey,
            ),
            onPressed: () async {
              if (ref.read(homeProvider).historyData[widget.pet_history] == false) {
                ref.read(homeProvider).historyData[widget.pet_history] = true;
                ref.read(homeProvider).adoptedPet.add(widget.pet_details);
                ref.read(homeProvider).dataNotify();
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text("You’ve now adopted ${widget.pet_details.name}"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Center(
                          child: Container(
                            color: Colors.blue,
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
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
              child: Text(
                "Adopt me",
                style: TextStyle(fontSize: 20),
              ),
            ),
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
