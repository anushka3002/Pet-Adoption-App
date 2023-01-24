import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Container(
        child: Text(""),
      ),
    );
  }
}
