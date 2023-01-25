import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/details_page.dart';
import 'package:pet_adoption_app/history_page.dart';
import 'package:pet_adoption_app/infrastructure/provider/registration_provider.dart';
import 'package:pet_adoption_app/theme/theme_manager.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

ThemeManager _themeManager = ThemeManager();

class _HomePageState extends ConsumerState<HomePage> {
  void updateList(String value) {
    setState(() {
      ref.read(homeProvider).pets =
          ref.read(homeProvider).pets.where((element) => element.name!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text("Theme"), actions: [
        //   Switch(
        //       value: _themeManager.themeMode == ThemeMode.dark,
        //       onChanged: (newValue) {
        //         _themeManager.toggleTheme(newValue);
        //       })
        // ]),
        body: Container(
      // decoration: const BoxDecoration(color: Colors.blue),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 80, bottom: 15, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Find a new friend",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                textAlign: TextAlign.start,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HistoryPage()));
                },
                child: Row(children: const [
                  Icon(
                    Icons.history,
                    // color: Colors.black,
                  ),
                  Text(
                    "History",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        // color: Colors.black,
                        fontSize: 15),
                  )
                ]),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 20),
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
        ref.read(homeProvider).pets.isEmpty
            ? const Center(
                child: Text("No results found"),
              )
            : Expanded(
                child: ListView.builder(
                    itemCount: ref.read(homeProvider).pets.length,
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
                                  pet_details: ref.read(homeProvider).pets[i],
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
                                        : const Color.fromARGB(221, 203, 235, 247),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Image.asset(ref.read(homeProvider).pets[i].image, width: 200, height: 150))),
                                    Column(
                                      children: [
                                        Text(
                                          ref.read(homeProvider).pets[i].name,
                                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            ref.watch(homeProvider).historyData[i] == true ? "Already adopted" : "",
                                            style: TextStyle(color: Color.fromARGB(255, 79, 76, 76)),
                                          ),
                                        )
                                      ],
                                    ),
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
