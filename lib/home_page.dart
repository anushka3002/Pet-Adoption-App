import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/details_page.dart';
import 'package:pet_adoption_app/history_page.dart';
import 'package:pet_adoption_app/infrastructure/provider/registration_provider.dart';
import 'package:pet_adoption_app/pet_data_tile_new.dart';
import 'package:pet_adoption_app/theme/theme_manager.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

ThemeManager _themeManager = ThemeManager();

class _HomePageState extends ConsumerState<HomePage> {
  List<PetDataNewTile> display_pet_data = [];

  @override
  void initState() {
    // TODO: implement initState
    display_pet_data = ref.read(homeProvider).pets;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void updateList(String value) {
      setState(() {
        display_pet_data =
            ref.read(homeProvider).pets.where((element) => element.name!.toLowerCase().contains(value.toLowerCase())).toList();
      });
    }

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
                    itemCount: display_pet_data.length,
                    itemBuilder: (BuildContext context, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: InkWell(
                          onTap: () {
                            if (ref.watch(homeProvider).historyData[i] == true) {
                              inspect("already adopted");
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                  pet_details: display_pet_data[i],
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
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(20.0),
                                              child: SizedBox(
                                                height: 160,
                                                width: 200,
                                                child: Image.asset(
                                                  fit: BoxFit.fill,
                                                  display_pet_data[i].image,
                                                ),
                                              )),
                                        ),
                                        ref.watch(homeProvider).historyData[i] == true
                                            ? const Padding(
                                                padding: EdgeInsets.only(top: 0.0, bottom: 8.0),
                                                child: Text(
                                                  "Already adopted",
                                                  style: TextStyle(color: Color.fromARGB(255, 79, 76, 76)),
                                                ),
                                              )
                                            : const SizedBox.shrink()
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Text(
                                        display_pet_data[i].name,
                                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
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
