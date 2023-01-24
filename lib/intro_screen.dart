import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 167, 154, 228)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Column(
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/rabbit.jpeg'),
              radius: 220,
            ),
            Text(
              'Lets Find A Lovely Pet Or A Friend!',
              style: TextStyle(color: Colors.black, fontSize: 30, decoration: TextDecoration.none),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Now its easier than ever to find a friend or a new replacement for the family.',
              style: TextStyle(
                  color: Color.fromARGB(255, 78, 77, 77),
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.none),
              textAlign: TextAlign.start,
            )
          ],
        ),
      ),
    );
  }
}
