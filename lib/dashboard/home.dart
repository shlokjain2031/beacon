import 'package:beacon/widgets/app.dart';
import 'package:beacon/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeWidgetState();

}

class _HomeWidgetState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeaconTheme().secondaryColour,
      body: const Text(
        'home',
        style: TextStyle(
          color: Colors.black
        ),
      ),
    );
  }
}