import 'package:beacon/dashboard/home.dart';
import 'package:beacon/api/auth.dart';
import 'package:beacon/widgets/onboarding.dart';
import 'package:beacon/widgets/responsive_unit.dart';
import 'package:beacon/widgets/splash_screens.dart';
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
        '/onboarding' : (context) => const Onboarding(),
        '/onboarding/board-of-education' : (context) => const BoardOfEd(),
        '/onboarding/grade' : (context) => const Grade(),
        '/onboarding/comp-exam' : (context) => const CompExam(),
        '/onboarding/essay' : (context) => const Essay(),
        '/onboarding/extra-curricular' : (context) => const ExtraCurricular(),
        '/loading-universities-college-list' : (context) => const UniversitiesPromptSplashScreen()
      },
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
      backgroundColor: const BeaconTheme().secondaryColour,
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
                    // todo: link to auth then if dashboard exists, take to dashboard
                    // todo: build a backend script to get user universities
                  },
                  child: Container(
                      width: ResponsiveUnit().width(context, 175),
                      height: ResponsiveUnit().height(context, 68),
                      decoration: BoxDecoration(
                          color: const BeaconTheme().primaryColour,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [ const BeaconTheme().boxShadow ]
                      ),
                      child: Center(
                        child: Text(
                            'dashboard',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const BeaconTheme().secondaryColour,
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
                      'Generate your',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: const BeaconTheme().saturatedPrimaryColour,
                      ),
                    ),
                    Text(
                      'Safety - Reach List',
                      style: GoogleFonts.montserrat(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: const BeaconTheme().primaryColour,
                          decoration: TextDecoration.underline
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: ResponsiveUnit().height(context, 36),
                    ),
                    Text(
                        'Light the way to your goals',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: const BeaconTheme().saturatedPrimaryColour,
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
                            _showAuthDialog(context);
                          },
                          child: Container(
                            width: ResponsiveUnit().width(context, 360),
                            height: ResponsiveUnit().width(context, 120),
                            decoration: BoxDecoration(
                                color: const BeaconTheme().primaryColour,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [const BeaconTheme().boxShadow]
                            ),
                            child: Center(
                              child: Text(
                                'Create my\nPersonal College List',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: const BeaconTheme().secondaryColour,
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
                                color: const BeaconTheme().secondaryColour,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: const BeaconTheme().primaryColour, width: 3)
                            ),
                            child: Center(
                              child: Text(
                                'Visit a\nDummy Profile',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: const BeaconTheme().primaryColour,
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
              color: const BeaconTheme().saturatedPrimaryColour,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }

}

Future<void> _showAuthDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'authenticate',
          style: GoogleFonts.montserrat(
            color: const BeaconTheme().secondaryColour,
            fontWeight: FontWeight.bold,
            fontSize: 24
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const BeaconTheme().primaryColour,
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'we use your name & age from your google account',
                style: GoogleFonts.montserrat(
                    color: const BeaconTheme().secondaryColour,
                    fontWeight: FontWeight.normal,
                    fontSize: 10
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: InkWell(
              onTap: () {
                // todo: solve issue of dialog box disappearing
                Navigator.pop(context);

                // todo: check if user exists and then decide if where to navigate
                Auth().insertUserIntoDb().then((_) {

                  Navigator.pushNamed(context, '/onboarding');
                }).catchError((e) {
                  assert(e);
                });
              },
              child: Container(
                  width: ResponsiveUnit().width(context, 400),
                  height: ResponsiveUnit().height(context, 100),
                  decoration: BoxDecoration(
                      color: const BeaconTheme().secondaryColour,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child: Text(
                      'sign in using google',
                      style: GoogleFonts.montserrat(
                          color: const BeaconTheme().primaryColour,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
              ),
            ),
          ),
        ],
      );
    },
  );
}