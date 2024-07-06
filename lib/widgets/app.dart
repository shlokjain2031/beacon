import 'package:beacon/dashboard/home.dart';
import 'package:beacon/widgets/auth.dart';
import 'package:beacon/widgets/onboarding.dart';
import 'package:beacon/widgets/responsive_unit.dart';
import 'package:beacon/widgets/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BeaconApp extends StatelessWidget {
  const BeaconApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/trynow' : (context) => const LandingPage(),
        '/dashboard' : (context) => const Home(),
        '/auth' : (context) => const AuthScreen(),
        '/onboarding' : (context) => const Onboarding()
      },
      theme: ThemeData(
        primaryColor: BeaconTheme().primaryBackgroundColour,

      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return const Home();
            }
            else {
              return const LandingPage();
            }
          }
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const BeaconTheme().primaryBackgroundColour,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: ResponsiveUnit().width(context, 115),
                  height: ResponsiveUnit().height(context, 128),
                  child: const Image(
                    image: AssetImage('assets/beacon_logo.png'),
                  ),
                ),
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                      width: ResponsiveUnit().width(context, 175),
                      height: ResponsiveUnit().height(context, 68),
                      decoration: BoxDecoration(
                          color: const BeaconTheme().primaryFontColour,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            const BeaconTheme().boxShadow
                          ]
                      ),
                      child: Center(
                        child: Text(
                            'dashboard',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const BeaconTheme().primaryBackgroundColour,
                            )
                        ),
                      )
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: ResponsiveUnit().width(context, 350),
                  height: ResponsiveUnit().height(context, 535),
                  child: const Image(
                    image: AssetImage('assets/character_illustration_girl.png'),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'generate your',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: const BeaconTheme().secondaryFontColour,
                      ),
                    ),
                    Text(
                      'college application list',
                      style: GoogleFonts.montserrat(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: BeaconTheme().primaryFontColour,
                          decoration: TextDecoration.underline
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: ResponsiveUnit().height(context, 36),
                    ),
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nDonec convallis tempor',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: const BeaconTheme().secondaryFontColour,
                        ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: ResponsiveUnit().height(context, 64),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/auth');
                          },
                          child: Container(
                            width: ResponsiveUnit().width(context, 360),
                            height: ResponsiveUnit().width(context, 120),
                            decoration: BoxDecoration(
                                color: const BeaconTheme().primaryFontColour,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [const BeaconTheme().boxShadow]
                            ),
                            child: Center(
                              child: Text(
                                'create my\npersonal college list',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: const BeaconTheme().primaryBackgroundColour,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        InkWell(
                          onTap: () {
                            print("create random pressed");
                          },
                          child: Container(
                            width: ResponsiveUnit().width(context, 360),
                            height: ResponsiveUnit().width(context, 120),
                            decoration: BoxDecoration(
                                color: BeaconTheme().primaryBackgroundColour,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: BeaconTheme().primaryFontColour, width: 3)
                            ),
                            child: Center(
                              child: Text(
                                'visit a\ndummy profile',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: const BeaconTheme().primaryFontColour,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: ResponsiveUnit().width(context, 370),
                  height: ResponsiveUnit().height(context, 570),
                  child: const Image(
                    image: AssetImage('assets/character_illustration_boy.png'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ResponsiveUnit().height(context, 32),
            ),
            Divider(
              color: const BeaconTheme().secondaryFontColour,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }

}