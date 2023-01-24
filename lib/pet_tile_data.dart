import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PetDataTile extends StatelessWidget {
  final String petName;
  final String petAge;
  final String petPrice;
  final String petImage;
  final bool petAdopted;

  const PetDataTile(
      {super.key,
      required this.petName,
      required this.petAge,
      required this.petPrice,
      required this.petImage,
      required this.petAdopted});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        child: SingleChildScrollView(
          child: Column(
            children: [Image.asset(petImage), Text(petName)],
          ),
        ),
      ),
    ]);
  }
}
