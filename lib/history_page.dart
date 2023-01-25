import 'package:flutter/material.dart';
import 'package:pet_adoption_app/infrastructure/provider/registration_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(children: [
          ref.read(homeProvider).adoptedPet.isEmpty
              ? const Center(
                  child: Padding(
                  padding: EdgeInsets.only(top: 350.0),
                  child: Text("No pets adopted yet", style: TextStyle(fontSize: 25, color: Colors.blueGrey)),
                ))
              : Expanded(
                  child: ListView.builder(
                      itemCount: ref.read(homeProvider).adoptedPet.length,
                      itemBuilder: (BuildContext context, i) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration:
                                BoxDecoration(color: Color.fromARGB(255, 192, 208, 209), borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    ref.read(homeProvider).adoptedPet[i].image,
                                    width: 200,
                                    height: 150,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    ref.read(homeProvider).adoptedPet[i].name,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })),
        ]),
      ),
    );
  }
}
