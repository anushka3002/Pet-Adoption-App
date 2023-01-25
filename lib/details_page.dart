import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailsPage extends StatefulWidget {
  final String name;
  final String age;
  final String price;
  final String image;
  final bool adopted;

  const DetailsPage(
      {Key? key, required this.name, required this.age, required this.image, required this.price, required this.adopted})
      : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
            title: Text("Welcome"),
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(widget.image),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.name,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.price,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.age,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: ElevatedButton(
              onPressed: () {
                controller.play();
                // widget.adopted =true;
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text("You’ve now adopted ${widget.name}"),
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
              },
              child: Text('Adopt me'))),
      ConfettiWidget(
        confettiController: controller,
        shouldLoop: true,
        blastDirection: pi,
        particleDrag: 0.05,
        emissionFrequency: 0.05,
        numberOfParticles: 20,
        gravity: 0.05,
        colors: const [Colors.orange, Colors.yellow, Colors.pink],
        // blastDirection:,
      )
    ]);
  }
}
