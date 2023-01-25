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
        title: const Text("Welcome"),
      ),
      body: Column(children: [
        const Text("Pets Adopted", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
}
