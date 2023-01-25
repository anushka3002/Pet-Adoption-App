import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/infrastructure/provider/registration_provider.dart';

class IntroScreen extends ConsumerStatefulWidget {
  const IntroScreen({super.key});

  @override
  ConsumerState<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends ConsumerState<IntroScreen> {
  @override
  void initState() {
    // TODO: implement initState
    ref.read(homeProvider).startData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.blue),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 100, bottom: 20),
        child: Center(
          child: Column(
            children: const [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/rabbit.jpeg'),
                radius: 220,
              ),
              Text(
                'Lets Find A Lovely Pet Or A Friend!',
                style: TextStyle(color: Colors.black, fontSize: 30, decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Now its easier than ever to find a friend or a new replacement for the family.',
                style: TextStyle(
                    color: Color.fromARGB(255, 55, 51, 51),
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
