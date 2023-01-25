import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/details_page.dart';
import 'package:pet_adoption_app/history_page.dart';
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
    print(ref.read(homeProvider).historyData);
    print("anushka history data");
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Welcome"),
        // ),
        body: Container(
      decoration: BoxDecoration(color: Colors.blue),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 80, bottom: 15, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Find a new friend",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                textAlign: TextAlign.start,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new HistoryPage()));
                },
                child: Text(
                  "History",
                  style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
                ),
              )
            ],
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
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: InkWell(
                          onTap: () {
                            if (ref.watch(homeProvider).historyData[i] == true) {
                              print("already adopted");
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                  pet_details: ref.read(homeProvider).students[i],
                                  pet_history: i,
                                ),
                              ));
                            }
                          },
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: ref.watch(homeProvider).historyData[i] == true
                                        ? Colors.grey
                                        : Color.fromARGB(156, 207, 195, 237),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Padding(
                                            padding: EdgeInsets.all(20),
                                            child:
                                                Image.asset(ref.read(homeProvider).students[i].image, width: 200, height: 150))),
                                    Column(
                                      children: [
                                        Text(
                                          ref.read(homeProvider).students[i].name,
                                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8.0),
                                          child: Text(ref.watch(homeProvider).historyData[i] == true ? "Already adopted" : ""),
                                        )
                                      ],
                                    ),
                                    // Text(
                                    //   "Hey! Wanna adopt me?",
                                    //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    // ),
                                    // ElevatedButton(
                                    //     onPressed: () {
                                    //       if (ref.read(homeProvider).historyData[i] == true) {
                                    //         ref.read(homeProvider).historyData[i] = false;
                                    //       } else {
                                    //         ref.read(homeProvider).adoptedPet.add(ref.read(homeProvider).students[i]);
                                    //         // historyData[i] = true;
                                    //       }
                                    //       print(ref.read(homeProvider).adoptedPet);
                                    //       // inspect(adoptedPet);
                                    //       print("adopted");
                                    //     },
                                    //     child: Text("Adopted")),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
      ]),
    ));
  }
}
