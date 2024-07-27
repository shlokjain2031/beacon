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

  // todo: get user state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _secondaryColour,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  child: const Image(
                    image: AssetImage('assets/beacon_logo.png'),

                  ),
                ),
                Text(
                  'Hello'
                )
              ],
            )
          ],
        ),
      )
    );
  }
}

Color _primaryColour = const BeaconTheme().primaryColour;
Color _secondaryColour = const BeaconTheme().secondaryColour;
Color _saturatedPrimaryColour = const BeaconTheme().saturatedPrimaryColour;
BoxShadow _boxShadow = const BeaconTheme().boxShadow;