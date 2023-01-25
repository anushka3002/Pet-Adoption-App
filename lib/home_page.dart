import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/infrastructure/provider/registration_provider.dart';
import 'package:pet_adoption_app/pet_data_tile_new.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  void updateList(String value) {
    setState(() {
      // List display_list = ref.read(homeProvider).students;
      ref.read(homeProvider).students =
          ref.read(homeProvider).students.where((element) => element.name!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Welcome"),
        // ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(left: 20, top: 80, bottom: 15),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Find a new friend",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          onChanged: (value) {
            updateList(value);
          },
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(221, 229, 240, 244),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide.none),
            hintText: "eg: Dog",
            prefixIcon: const Icon(Icons.search),
          ),
        ),
      ),
      ref.read(homeProvider).students.isEmpty
          ? const Center(
              child: Text("No results found"),
            )
          : Expanded(
              child: ListView.builder(
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
                  }),
            ),
    ]));
  }
}
