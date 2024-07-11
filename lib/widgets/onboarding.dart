import 'dart:ui';

import 'package:beacon/model/portfolio.dart';
import 'package:beacon/widgets/responsive_unit.dart';
import 'package:beacon/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const BeaconTheme().secondaryColour,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 24, 0, 42),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: ResponsiveUnit().width(context, 390),
                height: ResponsiveUnit().width(context, 200),
                child: const Image(
                  image: AssetImage('assets/beacon_long_logo.png'),
                ),
              ),
              Text(
                'creating your college list',
                style: GoogleFonts.montserrat(
                    decoration: TextDecoration.underline,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: const BeaconTheme().primaryColour
                ),
              ),
              Text(
                'we will ask you five questions\nto build you a basic safety - reach list',
                style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: const BeaconTheme().primaryColour
                ),
                textAlign: TextAlign.center,
              ),
              InkWell(
                onTap: () {
                  int initialPageNumber = 1;
                  Navigator.pushNamed(context, '/onboarding/create-my-college-list', arguments: initialPageNumber);
                },
                child: Container(
                  width: ResponsiveUnit().width(context, 240),
                  height: ResponsiveUnit().height(context, 90),
                  decoration: BoxDecoration(
                      color: const BeaconTheme().primaryColour,
                      boxShadow: [ const BeaconTheme().boxShadow ],
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child: Center(
                    child: Text(
                      'create!',
                      style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const BeaconTheme().secondaryColour
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

class CreateCollegeList extends StatelessWidget {
  CreateCollegeList({super.key, portfolio, pageNumber});

  @override
  Widget build(BuildContext context) {

    int pageNumber = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      backgroundColor: const BeaconTheme().secondaryColour,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'creating you college list',
                style: GoogleFonts.montserrat(
                    color: const BeaconTheme().primaryColour,
                    fontWeight: FontWeight.bold,
                    fontSize: 36
                ),
                textAlign: TextAlign.center,
              )
            ),
            _progressOfOnboarding(pageNumber, context)
            // _questionDecider(pageNumber, portfolio)
          ],
        ),
      ),
    );
  }
}

const _totalNumberOfPages = 5;

Widget _progressOfOnboarding(int pageNumber, BuildContext context) {
  return Center(
    child: SizedBox(
      width: ResponsiveUnit().width(context, 1260),
      height: ResponsiveUnit().height(context, 20),
      child: LinearProgressIndicator(
        borderRadius: BorderRadius.circular(10),
        value: pageNumber/_totalNumberOfPages,
        backgroundColor: const BeaconTheme().saturatedPrimaryColour,
        // valueColor: const BeaconTheme().primaryColour,
      ),
    ),
  );
}

Widget _questionDecider(int pageNumber, Portfolio portfolio) {
  switch(pageNumber) {
    case 1:
      return BoardOfEducation(portfolio: portfolio);

    case 2:
      return Grade(portfolio: portfolio);

    case 3:
      return CompExam(portfolio: portfolio);

    case 4:
      return EnglishExam(portfolio: portfolio);
  }

  return const Text(
      'sory'
  );
}

class BoardOfEducation extends StatelessWidget {
  const BoardOfEducation({super.key, required Portfolio portfolio});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class Grade extends StatelessWidget {
  const Grade({super.key, required Portfolio portfolio});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

}

class CompExam extends StatelessWidget {
  const CompExam({super.key, required Portfolio portfolio});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class EnglishExam extends StatelessWidget {
  const EnglishExam({super.key, required Portfolio portfolio});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}