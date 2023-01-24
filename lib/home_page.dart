// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pet_adoption_app/common/constants/image_constants.dart';
import 'package:pet_adoption_app/details_page.dart';
import 'package:pet_adoption_app/pet_tile_data.dart';
import 'package:pet_adoption_app/pets_data.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  // final String name, age, price, image;
  // final bool adopted;

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//   List<String> petNames = ['Dog', 'Cat', 'Rabbit', 'Duck', 'Fish', 'Dog2', 'Parrot', 'Pegion', 'Dog3', 'Tortoise'];
//   List<String> petImages = [
//     'assets/images/dog.jpeg',
//     'assets/images/cat.jpeg',
//     'assets/images/rabbit.jpeg',
//     'assets/images/duck.jpeg',
//     'assets/images/fish.jpeg',
//     'assets/images/dog2.jpeg',
//     'assets/images/parrot.jpeg',
//     'assets/images/pegion.jpeg',
//     'assets/images/dog3.jpeg',
//     'assets/images/tortoise.jpeg',
//   ];

//   List<HomePage> petData = [
//     const HomePage(name: "Dog", age: "19", price: '130', image: "assets/images/dog.jpeg", adopted: false),
//     const HomePage(name: "Cat", age: "20", price: '140', image: "assets/images/cat.jpeg", adopted: false),
//     const HomePage(name: "Rabbit", age: "18", price: '200', image: "assets/images/rabbit.jpeg", adopted: false),
//     const HomePage(name: "Duck", age: "18", price: '120', image: "assets/images/duck.jpeg", adopted: false),
//     const HomePage(name: "Fish", age: "19", price: '130', image: "assets/images/fish.jpeg", adopted: false),
//     const HomePage(name: "Dog2", age: "24", price: '130', image: "assets/images/dog2.jpeg", adopted: false),
//     const HomePage(name: "Parrot", age: "21", price: '130', image: "assets/images/parrot.jpeg", adopted: false),
//     const HomePage(name: "Pegion", age: "18", price: '130', image: "assets/images/pegion.jpeg", adopted: false),
//     const HomePage(name: "Dog3", age: "20", price: '130', image: "assets/images/dog3.jpeg", adopted: false),
//     const HomePage(name: "Tortoise", age: "26", price: '130', image: "assets/images/tortoise.jpeg", adopted: false),
//   ];

//   late var studentsmap = petData.map((e) {
//     return {"name": e.name, "age": e.age, "price": e.price, "image": e.image, "adopted": e.adopted};
//   }).toList();

  // name, age, price, image and an Adopt Me

  late String name;
  late String image;

  // Widget buildMenuRow(int index) {
  //   print(studentsmap);
  //   print("anushka");
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //     child: InkWell(
  //       onTap: () {
  //         Navigator.of(context)
  //             .push(new MaterialPageRoute(builder: (context) => new DetailsPage(name: petNames[index], image: petImages[index])));
  //       },
  //       child: Row(
  //         children: <Widget>[
  //           Image.asset(
  //             petImages[index],
  //             width: 150,
  //             height: 100,
  //           ),
  //           Text(
  //             petNames[index],
  //             style: const TextStyle(
  //               color: Colors.black,
  //               fontSize: 20,
  //               fontWeight: FontWeight.w300,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // print(studentsmap);
    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(child: Consumer<PetData>(
                builder: (context, value, child) {
                  return GridView.builder(
                      itemCount: value.petData.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (context) => new DetailsPage(
                                      name: value.petData[index][0],
                                      age: value.petData[index][1],
                                      price: value.petData[index][2],
                                      image: value.petData[index][3],
                                      adopted: value.petData[index][4],
                                    )));
                          },
                          child: PetDataTile(
                            petName: value.petData[index][0],
                            petAge: value.petData[index][1],
                            petPrice: value.petData[index][2],
                            petImage: value.petData[index][3],
                            petAdopted: value.petData[index][4],
                          ),
                        );
                      });
                },
              )),
            ],
          ),
        )
        // Container(
        //   child: SingleChildScrollView(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: petImages.asMap().entries.map((e) => buildMenuRow(e.key)).toList(),
        //       // children: PetData.map((e) => return(

        //       // )),
        //     ),
        //   ),
        // ),
        );
  }
}

// class SinglePet extends StatelessWidget {
// const SinglePet({super.key, required this.pet_name, required this.pet_age, required this.pet_age, required this.pet_price, required this.});
//   final pet_name,
//   final pet_age,
//   final

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
