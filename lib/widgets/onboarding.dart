import 'dart:ui';

import 'package:beacon/api/portfolio.dart';
import 'package:beacon/model/auth.dart';
import 'package:beacon/model/portfolio.dart';
import 'package:beacon/widgets/responsive_unit.dart';
import 'package:beacon/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                    decorationColor: _primaryColour,
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
                  Navigator.pushNamed(context, '/onboarding/board-of-education');
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

Color _primaryColour = const BeaconTheme().primaryColour;
Color _secondaryColour = const BeaconTheme().secondaryColour;
BoxShadow _boxShadow = const BeaconTheme().boxShadow;
// todo: refactor this throughout the repo

class BoardOfEd extends StatefulWidget {
  const BoardOfEd({super.key});

  @override
  State<StatefulWidget> createState() => _BoardOfEdState();
}

class _BoardOfEdState extends State<BoardOfEd> {

  String boardOfEdInTenth = "";
  String boardOfEdInTwelfth = "";

  late Map<String, Object> portfolio = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _secondaryColour,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(64, 24, 64, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
                  'creating your college list',
                  style: GoogleFonts.montserrat(
                      color: _primaryColour,
                      fontWeight: FontWeight.bold,
                      fontSize: 36
                  ),
                  textAlign: TextAlign.center,
                )
            ),
            SizedBox(
              height: ResponsiveUnit().height(context, 48),
            ),
            Center(
                child: SizedBox(
                  height: ResponsiveUnit().height(context, 20),
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(10),
                    value: _boardOfEdPageNum/_totalNumberOfPages,
                    backgroundColor: const BeaconTheme().saturatedPrimaryColour,
                  ),
                )
            ),
            SizedBox(
              height: ResponsiveUnit().height(context, 64),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'board of education in 10th',
                  style: GoogleFonts.montserrat(
                      decoration: TextDecoration.underline,
                      decorationColor: _primaryColour,
                      fontWeight: FontWeight.normal,
                      fontSize: 36,
                      color: _primaryColour
                  ),
                ),
                SizedBox(
                  height: ResponsiveUnit().height(context, 48),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          boardOfEdInTenth = "cbse/icse";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 200),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: boardOfEdInTenth == "cbse/icse" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'cbse/icse',
                            style: GoogleFonts.montserrat(
                                color: boardOfEdInTenth == "cbse/icse" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          boardOfEdInTenth = "state";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 200),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: boardOfEdInTenth == "state" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'state',
                            style: GoogleFonts.montserrat(
                                color: boardOfEdInTenth == "state" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          boardOfEdInTenth = "open schooling";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 200),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: boardOfEdInTenth == "open schooling" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'open schooling',
                            style: GoogleFonts.montserrat(
                                color: boardOfEdInTenth == "open schooling" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          boardOfEdInTenth = "igcse";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 200),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: boardOfEdInTenth == "igcse" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'igcse',
                            style: GoogleFonts.montserrat(
                                color: boardOfEdInTenth == "igcse" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ResponsiveUnit().height(context, 100),
                ),

                Text(
                  'board of education in 12th',
                  style: GoogleFonts.montserrat(
                      decoration: TextDecoration.underline,
                      decorationColor: _primaryColour,
                      fontWeight: FontWeight.normal,
                      fontSize: 36,
                      color: _primaryColour
                  ),
                ),
                SizedBox(
                  height: ResponsiveUnit().height(context, 48),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          boardOfEdInTwelfth = "cbse/icse";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 200),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: boardOfEdInTwelfth == "cbse/icse" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'cbse/icse',
                            style: GoogleFonts.montserrat(
                                color: boardOfEdInTwelfth == "cbse/icse" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          boardOfEdInTwelfth = "state";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 200),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: boardOfEdInTwelfth == "state" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'state',
                            style: GoogleFonts.montserrat(
                                color: boardOfEdInTwelfth == "state" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          boardOfEdInTwelfth = "ib";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 200),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: boardOfEdInTwelfth == "ib" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'ib',
                            style: GoogleFonts.montserrat(
                                color: boardOfEdInTwelfth == "ib" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          boardOfEdInTwelfth = "a - levels";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 200),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: boardOfEdInTwelfth == "a - levels" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'a - levels',
                            style: GoogleFonts.montserrat(
                                color: boardOfEdInTwelfth == "a - levels" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ResponsiveUnit().height(context, 64),
                ),
              ],
            ),

            InkWell(
              onTap: () {
                if(boardOfEdInTenth.isNotEmpty && boardOfEdInTwelfth.isNotEmpty) {
                  portfolio["boardOfEdInTenth"] = boardOfEdInTenth;
                  portfolio["boardOfEdInTwelfth"] = boardOfEdInTwelfth;
                  Navigator.pushNamed(context, '/onboarding/grade', arguments: portfolio);
                }
                else {
                  // todo: pop a message that informs input all questions
                }
              },
              child: Container(
                  width: ResponsiveUnit().width(context, 200),
                  height: ResponsiveUnit().height(context, 85),
                  decoration: BoxDecoration(
                      color: boardOfEdInTenth.isNotEmpty && boardOfEdInTwelfth.isNotEmpty ? _primaryColour : _secondaryColour,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: boardOfEdInTenth.isNotEmpty && boardOfEdInTwelfth.isNotEmpty ? [ _boxShadow ] : null,
                      border: Border.all(color: _primaryColour, width: 3)
                  ),
                  child: Center(
                    child: Text(
                      'next!',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: boardOfEdInTenth.isNotEmpty && boardOfEdInTwelfth.isNotEmpty ? _secondaryColour : _primaryColour,
                        fontSize: 20,
                      ),
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}

const _totalNumberOfPages = 5;
const _boardOfEdPageNum = 1;
const _gradePageNum = 2;
const _compExamPageNum = 3;
const _englishExamPageNum = 4;

class Grade extends StatefulWidget {
  const Grade({super.key});

  @override
  State<StatefulWidget> createState() => _GradeState();

}

class _GradeState extends State<Grade> {

  String gradeInTenth = "";
  String gradeInTwelfth = "";

  @override
  Widget build(BuildContext context) {
    final portfolio = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    return Scaffold(
      backgroundColor: _secondaryColour,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(64, 24, 64, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
                  'creating your college list',
                  style: GoogleFonts.montserrat(
                      color: _primaryColour,
                      fontWeight: FontWeight.bold,
                      fontSize: 36
                  ),
                  textAlign: TextAlign.center,
                )
            ),
            SizedBox(
              height: ResponsiveUnit().height(context, 48),
            ),
            Center(
                child: SizedBox(
                  height: ResponsiveUnit().height(context, 20),
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(10),
                    value: _gradePageNum/_totalNumberOfPages,
                    backgroundColor: const BeaconTheme().saturatedPrimaryColour,
                  ),
                )
            ),
            SizedBox(
              height: ResponsiveUnit().height(context, 64),
            ),

            gradeDeciderTenth(portfolio),

            SizedBox(
              height: ResponsiveUnit().height(context, 64),
            ),

            gradeDeciderTwelfth(portfolio),

            SizedBox(
              height: ResponsiveUnit().height(context, 64),
            ),

            InkWell(
              onTap: () {
                if(gradeInTenth.isNotEmpty && gradeInTwelfth.isNotEmpty) {
                  portfolio["gradeInTenth"] = gradeInTenth;
                  portfolio["gradeInTwelfth"] = gradeInTwelfth;
                  Navigator.pushNamed(context, '/onboarding/comp-exam', arguments: portfolio);
                }
              },
              child: Container(
                  width: ResponsiveUnit().width(context, 200),
                  height: ResponsiveUnit().height(context, 85),
                  decoration: BoxDecoration(
                      color: gradeInTenth.isNotEmpty && gradeInTwelfth.isNotEmpty ? _primaryColour : _secondaryColour,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: gradeInTenth.isNotEmpty && gradeInTwelfth.isNotEmpty ? [ _boxShadow ] : null,
                      border: Border.all(color: _primaryColour, width: 3)
                  ),
                  child: Center(
                    child: Text(
                      'next!',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: gradeInTenth.isNotEmpty && gradeInTwelfth.isNotEmpty ? _secondaryColour : _primaryColour,
                        fontSize: 20,
                      ),
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget gradeDeciderTenth(Map<String, Object> portfolio) {
    switch(portfolio["boardOfEdInTenth"]) {
      case "cbse/icse":
        return SizedBox(
          width: ResponsiveUnit().width(context, 1260),
          height: ResponsiveUnit().height(context, 220),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'class 10th %age at ${portfolio["boardOfEdInTenth"] as String}',
                style: GoogleFonts.montserrat(
                    decoration: TextDecoration.underline,
                    decorationColor: _primaryColour,
                    fontWeight: FontWeight.normal,
                    fontSize: 36,
                    color: _primaryColour
                ),
              ),
              SizedBox(
                height: ResponsiveUnit().height(context, 48),
              ),

              SizedBox(
                width: ResponsiveUnit().width(context, 140),
                height: ResponsiveUnit().height(context, 80),
                child: Row(
                  children: [
                    SizedBox(
                      width: ResponsiveUnit().width(context, 60),
                      height: ResponsiveUnit().height(context, 80),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: '93',
                            hintStyle: GoogleFonts.montserrat(
                                decoration: TextDecoration.underline,
                                decorationColor: const BeaconTheme().saturatedPrimaryColour,
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                color: const BeaconTheme().saturatedPrimaryColour
                            ),
                            hintMaxLines: 1,
                            border: InputBorder.none
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (String inputGradeInTenth) {
                          setState(() {
                            gradeInTenth = inputGradeInTenth;
                          });
                        },
                        style: GoogleFonts.montserrat(
                            decoration: TextDecoration.underline,
                            decorationColor: _primaryColour,
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                            color: _primaryColour
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],

                      ),
                    ),
                    Text(
                      '%',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: const BeaconTheme().saturatedPrimaryColour
                      ),
                    )
                  ],
                ),
              ),


            ],
          ),
        );

      case "state":
        return SizedBox(
          width: ResponsiveUnit().width(context, 1260),
          height: ResponsiveUnit().height(context, 220),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'class 10th %age at ${portfolio["boardOfEdInTenth"] as String}',
                style: GoogleFonts.montserrat(
                    decoration: TextDecoration.underline,
                    decorationColor: _primaryColour,
                    fontWeight: FontWeight.normal,
                    fontSize: 36,
                    color: _primaryColour
                ),
              ),
              SizedBox(
                height: ResponsiveUnit().height(context, 48),
              ),

              SizedBox(
                width: ResponsiveUnit().width(context, 140),
                height: ResponsiveUnit().height(context, 80),
                child: Row(
                  children: [
                    SizedBox(
                      width: ResponsiveUnit().width(context, 60),
                      height: ResponsiveUnit().height(context, 80),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: '93',
                            hintStyle: GoogleFonts.montserrat(
                                decoration: TextDecoration.underline,
                                decorationColor: const BeaconTheme().saturatedPrimaryColour,
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                color: const BeaconTheme().saturatedPrimaryColour
                            ),
                            hintMaxLines: 1,
                            border: InputBorder.none
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (String inputGradeInTenth) {
                          setState(() {
                            gradeInTenth = inputGradeInTenth;
                          });
                        },
                        style: GoogleFonts.montserrat(
                            decoration: TextDecoration.underline,
                            decorationColor: _primaryColour,
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                            color: _primaryColour
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],

                      ),
                    ),
                    Text(
                      '%',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: const BeaconTheme().saturatedPrimaryColour
                      ),
                    )
                  ],
                ),
              ),


            ],
          ),
        );

      case "open schooling":
        return SizedBox(
          width: ResponsiveUnit().width(context, 1260),
          height: ResponsiveUnit().height(context, 220),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'class 10th %age at ${portfolio["boardOfEdInTenth"] as String}',
                style: GoogleFonts.montserrat(
                    decoration: TextDecoration.underline,
                    decorationColor: _primaryColour,
                    fontWeight: FontWeight.normal,
                    fontSize: 36,
                    color: _primaryColour
                ),
              ),
              SizedBox(
                height: ResponsiveUnit().height(context, 48),
              ),

              SizedBox(
                width: ResponsiveUnit().width(context, 140),
                height: ResponsiveUnit().height(context, 80),
                child: Row(
                  children: [
                    SizedBox(
                      width: ResponsiveUnit().width(context, 60),
                      height: ResponsiveUnit().height(context, 80),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: '93',
                            hintStyle: GoogleFonts.montserrat(
                                decoration: TextDecoration.underline,
                                decorationColor: const BeaconTheme().saturatedPrimaryColour,
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                color: const BeaconTheme().saturatedPrimaryColour
                            ),
                            hintMaxLines: 1,
                            border: InputBorder.none
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (String inputGradeInTenth) {
                          setState(() {
                            gradeInTenth = inputGradeInTenth;
                          });
                        },
                        style: GoogleFonts.montserrat(
                            decoration: TextDecoration.underline,
                            decorationColor: _primaryColour,
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                            color: _primaryColour
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],

                      ),
                    ),
                    Text(
                      '%',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: const BeaconTheme().saturatedPrimaryColour
                      ),
                    )
                  ],
                ),
              ),


            ],
          ),
        );

      case "igcse":
        return SizedBox(
          width: ResponsiveUnit().width(context, 1260),
          height: ResponsiveUnit().height(context, 220),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'igcse grade',
                style: GoogleFonts.montserrat(
                    decoration: TextDecoration.underline,
                    decorationColor: _primaryColour,
                    fontWeight: FontWeight.normal,
                    fontSize: 36,
                    color: _primaryColour
                ),
              ),
              SizedBox(
                height: ResponsiveUnit().height(context, 48),
              ),

              SizedBox(
                width: ResponsiveUnit().width(context, 1250),
                height: ResponsiveUnit().height(context, 80),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          gradeInTenth = "A*";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 125),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: gradeInTenth == "A*" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'A*',
                            style: GoogleFonts.montserrat(
                                color: gradeInTenth == "A*" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          gradeInTenth = "A";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 125),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: gradeInTenth == "A" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'A',
                            style: GoogleFonts.montserrat(
                                color: gradeInTenth == "A" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          gradeInTenth = "B";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 125),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: gradeInTenth == "B" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'B',
                            style: GoogleFonts.montserrat(
                                color: gradeInTenth == "B" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          gradeInTenth = "C";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 125),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: gradeInTenth == "C" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'C',
                            style: GoogleFonts.montserrat(
                                color: gradeInTenth == "C" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          gradeInTenth = "D";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 125),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: gradeInTenth == "D" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'D',
                            style: GoogleFonts.montserrat(
                                color: gradeInTenth == "D" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          gradeInTenth = "E";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 125),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: gradeInTenth == "E" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'E',
                            style: GoogleFonts.montserrat(
                                color: gradeInTenth == "E" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          gradeInTenth = "U";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 125),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: gradeInTenth == "U" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'U',
                            style: GoogleFonts.montserrat(
                                color: gradeInTenth == "U" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),


            ],
          ),
        );
    }

    // todo: add an error message
    return Text('sory');
  }

  Widget gradeDeciderTwelfth(Map<String, Object> portfolio) {
    switch(portfolio["boardOfEdInTwelfth"]) {
      case "cbse/icse":
        return SizedBox(
          width: ResponsiveUnit().width(context, 1260),
          height: ResponsiveUnit().height(context, 220),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'class 12th %age at ${portfolio["boardOfEdInTwelfth"] as String}',
                style: GoogleFonts.montserrat(
                    decoration: TextDecoration.underline,
                    decorationColor: _primaryColour,
                    fontWeight: FontWeight.normal,
                    fontSize: 36,
                    color: _primaryColour
                ),
              ),
              SizedBox(
                height: ResponsiveUnit().height(context, 48),
              ),

              SizedBox(
                width: ResponsiveUnit().width(context, 140),
                height: ResponsiveUnit().height(context, 80),
                child: Row(
                  children: [
                    SizedBox(
                      width: ResponsiveUnit().width(context, 60),
                      height: ResponsiveUnit().height(context, 80),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: '89',
                            hintStyle: GoogleFonts.montserrat(
                                decoration: TextDecoration.underline,
                                decorationColor: const BeaconTheme().saturatedPrimaryColour,
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                color: const BeaconTheme().saturatedPrimaryColour
                            ),
                            hintMaxLines: 1,
                            border: InputBorder.none
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (String inputGradeInTwelfth) {
                          setState(() {
                            gradeInTwelfth = inputGradeInTwelfth;
                          });
                        },
                        style: GoogleFonts.montserrat(
                            decoration: TextDecoration.underline,
                            decorationColor: _primaryColour,
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                            color: _primaryColour
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],

                      ),
                    ),
                    Text(
                      '%',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: const BeaconTheme().saturatedPrimaryColour
                      ),
                    )
                  ],
                ),
              ),


            ],
          ),
        );

      case "state":
        return SizedBox(
          width: ResponsiveUnit().width(context, 1260),
          height: ResponsiveUnit().height(context, 220),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'class 12th %age at ${portfolio["boardOfEdInTwelfth"] as String}',
                style: GoogleFonts.montserrat(
                    decoration: TextDecoration.underline,
                    decorationColor: _primaryColour,
                    fontWeight: FontWeight.normal,
                    fontSize: 36,
                    color: _primaryColour
                ),
              ),
              SizedBox(
                height: ResponsiveUnit().height(context, 48),
              ),

              SizedBox(
                width: ResponsiveUnit().width(context, 140),
                height: ResponsiveUnit().height(context, 80),
                child: Row(
                  children: [
                    SizedBox(
                      width: ResponsiveUnit().width(context, 60),
                      height: ResponsiveUnit().height(context, 80),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: '89',
                            hintStyle: GoogleFonts.montserrat(
                                decoration: TextDecoration.underline,
                                decorationColor: const BeaconTheme().saturatedPrimaryColour,
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                color: const BeaconTheme().saturatedPrimaryColour
                            ),
                            hintMaxLines: 1,
                            border: InputBorder.none
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (String inputGradeInTwelfth) {
                          setState(() {
                            gradeInTwelfth = inputGradeInTwelfth;
                          });
                        },
                        style: GoogleFonts.montserrat(
                            decoration: TextDecoration.underline,
                            decorationColor: _primaryColour,
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                            color: _primaryColour
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],

                      ),
                    ),
                    Text(
                      '%',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: gradeInTwelfth.isNotEmpty ? _primaryColour : const BeaconTheme().saturatedPrimaryColour
                      ),
                    )
                  ],
                ),
              ),


            ],
          ),
        );

      case "ib":
        return SizedBox();

      case "a - levels":
        return SizedBox(
          width: ResponsiveUnit().width(context, 1260),
          height: ResponsiveUnit().height(context, 220),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'a - levels grade',
                style: GoogleFonts.montserrat(
                    decoration: TextDecoration.underline,
                    decorationColor: _primaryColour,
                    fontWeight: FontWeight.normal,
                    fontSize: 36,
                    color: _primaryColour
                ),
              ),
              SizedBox(
                height: ResponsiveUnit().height(context, 48),
              ),

              SizedBox(
                width: ResponsiveUnit().width(context, 1250),
                height: ResponsiveUnit().height(context, 80),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          gradeInTwelfth = "A*";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 125),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: gradeInTwelfth == "A*" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'A*',
                            style: GoogleFonts.montserrat(
                                color: gradeInTwelfth == "A*" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          gradeInTwelfth = "A";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 125),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: gradeInTwelfth == "A" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'A',
                            style: GoogleFonts.montserrat(
                                color: gradeInTwelfth == "A" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          gradeInTwelfth = "B";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 125),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: gradeInTwelfth == "B" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'B',
                            style: GoogleFonts.montserrat(
                                color: gradeInTwelfth == "B" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          gradeInTwelfth = "C";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 125),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: gradeInTwelfth == "C" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'C',
                            style: GoogleFonts.montserrat(
                                color: gradeInTwelfth == "C" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          gradeInTwelfth = "D";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 125),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: gradeInTwelfth == "D" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'D',
                            style: GoogleFonts.montserrat(
                                color: gradeInTwelfth == "D" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          gradeInTwelfth = "E";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 125),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: gradeInTwelfth == "E" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'E',
                            style: GoogleFonts.montserrat(
                                color: gradeInTwelfth == "E" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          gradeInTwelfth = "U";
                        });
                      },
                      child: Container(
                        width: ResponsiveUnit().width(context, 125),
                        height: ResponsiveUnit().height(context, 70),
                        decoration: BoxDecoration(
                            color: gradeInTwelfth == "U" ? _primaryColour : _secondaryColour,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: _primaryColour, width: 3)
                        ),
                        child: Center(
                          child: Text(
                            'U',
                            style: GoogleFonts.montserrat(
                                color: gradeInTwelfth == "U" ? _secondaryColour : _primaryColour,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),


            ],
          ),
        );
    }

    /// todo: add an error message
    return Text('sory');
  }
}

class CompExam extends StatefulWidget {
  const CompExam({super.key});

  @override
  State<StatefulWidget> createState() => _CompExamState();

}

class _CompExamState extends State<CompExam> {

  int scoreInSat = 0;
  int scoreInAct = 0;

  @override
  Widget build(BuildContext context) {

    final portfolio = ModalRoute.of(context)?.settings.arguments as Map<String, Object?>;

    return Scaffold(
      backgroundColor: _secondaryColour,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(64, 24, 64, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
                  'creating your college list',
                  style: GoogleFonts.montserrat(
                      color: _primaryColour,
                      fontWeight: FontWeight.bold,
                      fontSize: 36
                  ),
                  textAlign: TextAlign.center,
                )
            ),
            SizedBox(
              height: ResponsiveUnit().height(context, 48),
            ),
            Center(
                child: SizedBox(
                  height: ResponsiveUnit().height(context, 20),
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(10),
                    value: _compExamPageNum/_totalNumberOfPages,
                    backgroundColor: const BeaconTheme().saturatedPrimaryColour,
                  ),
                )
            ),
            SizedBox(
              height: ResponsiveUnit().height(context, 64),
            ),

            SizedBox(
              width: ResponsiveUnit().width(context, 1260),
              height: ResponsiveUnit().height(context, 470),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'sat',
                    style: GoogleFonts.montserrat(
                        decoration: TextDecoration.underline,
                        decorationColor: _primaryColour,
                        fontWeight: FontWeight.normal,
                        fontSize: 36,
                        color: _primaryColour
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveUnit().height(context, 12),
                  ),
                  SizedBox(
                    width: ResponsiveUnit().width(context, 280),
                    height: ResponsiveUnit().height(context, 150),
                    child: Row(
                      children: [
                        SizedBox(
                          width: ResponsiveUnit().width(context, 115),
                          height: ResponsiveUnit().height(context, 80),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: '1450',
                                hintStyle: GoogleFonts.montserrat(
                                    decoration: TextDecoration.underline,
                                    decorationColor: const BeaconTheme().saturatedPrimaryColour,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36,
                                    color: const BeaconTheme().saturatedPrimaryColour
                                ),
                                hintMaxLines: 1,
                                border: InputBorder.none
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (String inputScoreInSat) {
                              setState(() {
                                scoreInSat = int.parse(inputScoreInSat);
                              });
                            },
                            style: GoogleFonts.montserrat(
                                decoration: TextDecoration.underline,
                                decorationColor: _primaryColour,
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                color: _primaryColour
                            ),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],

                          ),
                        ),
                        Text(
                          ' / 1600',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                              color: const BeaconTheme().saturatedPrimaryColour
                          ),
                        )
                      ],
                    ),
                  ),

                  Text(
                    'act',
                    style: GoogleFonts.montserrat(
                        decoration: TextDecoration.underline,
                        decorationColor: _primaryColour,
                        fontWeight: FontWeight.normal,
                        fontSize: 36,
                        color: _primaryColour
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveUnit().height(context, 48),
                  ),
                  SizedBox(
                    width: ResponsiveUnit().width(context, 200),
                    height: ResponsiveUnit().height(context, 80),
                    child: Row(
                      children: [
                        SizedBox(
                          width: ResponsiveUnit().width(context, 70),
                          height: ResponsiveUnit().height(context, 80),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: '24',
                                hintStyle: GoogleFonts.montserrat(
                                    decoration: TextDecoration.underline,
                                    decorationColor: const BeaconTheme().saturatedPrimaryColour,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36,
                                    color: const BeaconTheme().saturatedPrimaryColour
                                ),
                                hintMaxLines: 1,
                                border: InputBorder.none
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (String inputScoreInAct) {
                              setState(() {
                                scoreInAct = int.parse(inputScoreInAct);
                              });
                            },
                            style: GoogleFonts.montserrat(
                                decoration: TextDecoration.underline,
                                decorationColor: _primaryColour,
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                color: _primaryColour
                            ),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],

                          ),
                        ),
                        Text(
                          '/ 36',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                              color: const BeaconTheme().saturatedPrimaryColour
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: ResponsiveUnit().height(context, 64),
            ),

            InkWell(
              onTap: () {
                if(scoreInSat != 0 || scoreInAct != 0) {
                  portfolio["scoreInSat"] = scoreInSat;
                  portfolio["scoreInAct"] = scoreInAct;
                  Navigator.pushNamed(context, '/onboarding/english-exam', arguments: portfolio);
                }
              },
              child: Container(
                  width: ResponsiveUnit().width(context, 200),
                  height: ResponsiveUnit().height(context, 85),
                  decoration: BoxDecoration(
                      color: scoreInSat != 0 || scoreInAct != 0 ? _primaryColour : _secondaryColour,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: scoreInSat != 0 || scoreInAct != 0 ? [ _boxShadow ] : null,
                      border: Border.all(color: _primaryColour, width: 3)
                  ),
                  child: Center(
                    child: Text(
                      'next!',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: scoreInSat != 0 || scoreInAct != 0 ? _secondaryColour : _primaryColour,
                        fontSize: 20,
                      ),
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }

}

class EnglishExam extends StatefulWidget {
  const EnglishExam({super.key});

  @override
  State<StatefulWidget> createState() => _EnglishExamState();
}

class _EnglishExamState extends State<EnglishExam> {

  int scoreInToefl = 0;
  double scoreInIelts = 0;

  @override
  Widget build(BuildContext context) {

    final portfolio = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    return Scaffold(
      backgroundColor: _secondaryColour,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(64, 24, 64, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
                  'creating your college list',
                  style: GoogleFonts.montserrat(
                      color: _primaryColour,
                      fontWeight: FontWeight.bold,
                      fontSize: 36
                  ),
                  textAlign: TextAlign.center,
                )
            ),
            SizedBox(
              height: ResponsiveUnit().height(context, 48),
            ),
            Center(
                child: SizedBox(
                  height: ResponsiveUnit().height(context, 20),
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(10),
                    value: _englishExamPageNum/_totalNumberOfPages,
                    backgroundColor: const BeaconTheme().saturatedPrimaryColour,
                  ),
                )
            ),
            SizedBox(
              height: ResponsiveUnit().height(context, 64),
            ),

            SizedBox(
              width: ResponsiveUnit().width(context, 1260),
              height: ResponsiveUnit().height(context, 470),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'toefl',
                    style: GoogleFonts.montserrat(
                        decoration: TextDecoration.underline,
                        decorationColor: _primaryColour,
                        fontWeight: FontWeight.normal,
                        fontSize: 36,
                        color: _primaryColour
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveUnit().height(context, 12),
                  ),
                  SizedBox(
                    width: ResponsiveUnit().width(context, 280),
                    height: ResponsiveUnit().height(context, 150),
                    child: Row(
                      children: [
                        SizedBox(
                          width: ResponsiveUnit().width(context, 75),
                          height: ResponsiveUnit().height(context, 80),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: '87',
                                hintStyle: GoogleFonts.montserrat(
                                    decoration: TextDecoration.underline,
                                    decorationColor: const BeaconTheme().saturatedPrimaryColour,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36,
                                    color: const BeaconTheme().saturatedPrimaryColour
                                ),
                                hintMaxLines: 1,
                                border: InputBorder.none
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (String inputScoreInToefl) {
                              setState(() {
                                scoreInToefl = int.parse(inputScoreInToefl);
                              });
                            },
                            style: GoogleFonts.montserrat(
                                decoration: TextDecoration.underline,
                                decorationColor: _primaryColour,
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                color: _primaryColour
                            ),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],

                          ),
                        ),
                        Text(
                          ' / 120',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                              color: const BeaconTheme().saturatedPrimaryColour
                          ),
                        )
                      ],
                    ),
                  ),

                  Text(
                    'ielts',
                    style: GoogleFonts.montserrat(
                        decoration: TextDecoration.underline,
                        decorationColor: _primaryColour,
                        fontWeight: FontWeight.normal,
                        fontSize: 36,
                        color: _primaryColour
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveUnit().height(context, 48),
                  ),
                  SizedBox(
                    width: ResponsiveUnit().width(context, 200),
                    height: ResponsiveUnit().height(context, 80),
                    child: Row(
                      children: [
                        SizedBox(
                          width: ResponsiveUnit().width(context, 80),
                          height: ResponsiveUnit().height(context, 80),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: '8.5',
                                hintStyle: GoogleFonts.montserrat(
                                    decoration: TextDecoration.underline,
                                    decorationColor: const BeaconTheme().saturatedPrimaryColour,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36,
                                    color: const BeaconTheme().saturatedPrimaryColour
                                ),
                                hintMaxLines: 1,
                                border: InputBorder.none
                            ),
                            // todo: allow decimal
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            onChanged: (String inputScoreInIelts) {
                              setState(() {
                                scoreInIelts = double.parse(inputScoreInIelts);
                              });
                            },
                            style: GoogleFonts.montserrat(
                                decoration: TextDecoration.underline,
                                decorationColor: _primaryColour,
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                color: _primaryColour
                            ),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],

                          ),
                        ),
                        Text(
                          '/ 9',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                              color: const BeaconTheme().saturatedPrimaryColour
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: ResponsiveUnit().height(context, 64),
            ),

            InkWell(
              onTap: () {
                if(scoreInToefl != 0 || scoreInIelts != 0) {
                  portfolio["scoreInToefl"] = scoreInToefl;
                  portfolio["scoreInIelts"] = scoreInIelts;

                  PortfolioApi().insertPortfolio(
                    Portfolio(
                      Auth().getUserId() as String,
                      portfolio["boardOfEdInTenth"] as String,
                      portfolio["boardOfEdInTwelfth"] as String,
                      portfolio["gradeInTenth"] as String,
                      portfolio["gradeInTwelfth"] as String,
                      portfolio["scoreInSat"] as int,
                      portfolio["scoreInAct"] as int,
                      portfolio["scoreInToefl"] as int,
                      portfolio["scoreInIelts"] as double,
                    )
                  ).then((_) {
                    print("success");
                  }).catchError((e) {
                    print(e);
                  });

                  // todo: prompt eng
                }
              },
              child: Container(
                  width: ResponsiveUnit().width(context, 200),
                  height: ResponsiveUnit().height(context, 85),
                  decoration: BoxDecoration(
                      color: scoreInToefl != 0 || scoreInIelts != 0 ? _primaryColour : _secondaryColour,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: scoreInToefl != 0 || scoreInIelts != 0 ? [ _boxShadow ] : null,
                      border: Border.all(color: _primaryColour, width: 3)
                  ),
                  child: Center(
                    child: Text(
                      'next!',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: scoreInToefl != 0 || scoreInIelts != 0 ? _secondaryColour : _primaryColour,
                        fontSize: 20,
                      ),
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}