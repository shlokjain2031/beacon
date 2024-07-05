import 'package:beacon/dashboard/home.dart';
import 'package:beacon/widgets/auth.dart';
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
        '/onboarding' : (context) => const LandingPage(),
        '/dashboard' : (context) => const Home(),
        '/auth' : (context) => const AuthScreen()
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
        padding: const EdgeInsets.fromLTRB(42, 36, 0, 0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: ResponsiveUnit().width(context, 320),
                height: ResponsiveUnit().height(context, 160),
                child: const Image(
                  image: AssetImage('assets/beacon_logo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        )
                    ),
                    SizedBox(
                      height: ResponsiveUnit().height(context, 40),
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
                                color: BeaconTheme().primaryFontColour,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Center(
                              child: Text(
                                'create my\npersonal college list',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: BeaconTheme().primaryBackgroundColour,
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
                                'create a\nrandom college list',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: BeaconTheme().primaryFontColour,
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
                  width: ResponsiveUnit().width(context, 710),
                  height: ResponsiveUnit().height(context, 580),
                  child: const Image(
                    image: AssetImage('assets/character_illustrations.png'),
                  ),
                ) // vector art
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 24, 42, 0),
              child: Divider(
                color: BeaconTheme().secondaryFontColour,
                thickness: 2,
              ),
            )
          ],
        ),
      ),
    );
  }

}