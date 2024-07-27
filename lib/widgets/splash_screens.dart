import 'package:beacon/api/gemini.dart';
import 'package:beacon/dashboard/home.dart';
import 'package:beacon/widgets/responsive_unit.dart';
import 'package:beacon/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UniversitiesPromptSplashScreen extends StatelessWidget {
  const UniversitiesPromptSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _secondaryColour,
      body: FutureBuilder(
        future: GeminiApi().basicSafetyReachList,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return const Home();
          }
          else {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: ResponsiveUnit().height(context, 256),
                  ),
                  const Image(
                    image: AssetImage('assets/beacon_long_logo.png'),
                  ),
                  SizedBox(
                    height: ResponsiveUnit().height(context, 32),
                  ),
                  Text(
                    'your safety-reach list is being generated',
                    style: GoogleFonts.montserrat(
                        fontSize: 32,
                        color: _primaryColour,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

}

Color _primaryColour = const BeaconTheme().primaryColour;
Color _secondaryColour = const BeaconTheme().secondaryColour;
Color _saturatedPrimaryColour = const BeaconTheme().saturatedPrimaryColour;
BoxShadow _boxShadow = const BeaconTheme().boxShadow;
