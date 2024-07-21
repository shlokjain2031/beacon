import 'dart:core';
import 'dart:io';
import 'dart:ui';

import 'package:beacon/api/portfolio.dart';
import 'package:beacon/model/auth.dart';
import 'package:beacon/model/portfolio.dart';
import 'package:beacon/widgets/responsive_unit.dart';
import 'package:beacon/widgets/theme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
                'Creating Your College List',
                style: GoogleFonts.montserrat(
                    decoration: TextDecoration.underline,
                    decorationColor: _primaryColour,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: const BeaconTheme().primaryColour
                ),
              ),
              Text(
                'We will ask you five questions\nto build you a basic safety - reach list',
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
                      'Create!',
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
Color _saturatedPrimaryColour = const BeaconTheme().saturatedPrimaryColour;
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
                    backgroundColor: _saturatedPrimaryColour,
                  ),
                )
            ),
            SizedBox(
              height: ResponsiveUnit().height(context, 64),
            ),

            SizedBox(
              width: ResponsiveUnit().width(context, 1260),
              height: ResponsiveUnit().height(context, 540),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Board of Education in 10th',
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
                            boardOfEdInTenth = "IGCSE";
                          });
                        },
                        child: Container(
                          width: ResponsiveUnit().width(context, 200),
                          height: ResponsiveUnit().height(context, 70),
                          decoration: BoxDecoration(
                              color: boardOfEdInTenth == "IGCSE" ? _primaryColour : _secondaryColour,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: _primaryColour, width: 3)
                          ),
                          child: Center(
                            child: Text(
                              'IGCSE',
                              style: GoogleFonts.montserrat(
                                  color: boardOfEdInTenth == "IGCSE" ? _secondaryColour : _primaryColour,
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
                    'Board of Education in 12th',
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
                            boardOfEdInTwelfth = "A - Levels";
                          });
                        },
                        child: Container(
                          width: ResponsiveUnit().width(context, 200),
                          height: ResponsiveUnit().height(context, 70),
                          decoration: BoxDecoration(
                              color: boardOfEdInTwelfth == "A - Levels" ? _primaryColour : _secondaryColour,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: _primaryColour, width: 3)
                          ),
                          child: Center(
                            child: Text(
                              'A - Levels',
                              style: GoogleFonts.montserrat(
                                  color: boardOfEdInTwelfth == "A - Levels" ? _secondaryColour : _primaryColour,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: ResponsiveUnit().height(context, 64),
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
const _essayPageNum = 4;
const _extraCurricularPageNum = 5;

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
                    backgroundColor: _saturatedPrimaryColour,
                  ),
                )
            ),
            SizedBox(
              height: ResponsiveUnit().height(context, 64),
            ),

            SizedBox(
              width: ResponsiveUnit().width(context, 1260),
              height: ResponsiveUnit().height(context, 540),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gradeDeciderTenth(portfolio),

                  SizedBox(
                    height: ResponsiveUnit().height(context, 64),
                  ),

                  gradeDeciderTwelfth(portfolio),
                ],
              ),
            ),

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
                'Class 10th %age at ${portfolio["boardOfEdInTenth"] as String}',
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
                                decorationColor: _saturatedPrimaryColour,
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                color: _saturatedPrimaryColour
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
                          color: _saturatedPrimaryColour
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
                'Class 10th %age at ${portfolio["boardOfEdInTenth"] as String}',
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
                                decorationColor: _saturatedPrimaryColour,
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                color: _saturatedPrimaryColour
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
                          color: _saturatedPrimaryColour
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
                'Class 10th %age at ${portfolio["boardOfEdInTenth"] as String}',
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
                                decorationColor: _saturatedPrimaryColour,
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                color: _saturatedPrimaryColour
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
                          color: _saturatedPrimaryColour
                      ),
                    )
                  ],
                ),
              ),


            ],
          ),
        );

      case "IGCSE":
        return SizedBox(
          width: ResponsiveUnit().width(context, 1260),
          height: ResponsiveUnit().height(context, 220),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'IGCSE Grade',
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
                'Class 12th %age at ${portfolio["boardOfEdInTwelfth"] as String}',
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
                                decorationColor: _saturatedPrimaryColour,
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                color: _saturatedPrimaryColour
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
                          color: _saturatedPrimaryColour
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
                'Class 12th %age at ${portfolio["boardOfEdInTwelfth"] as String}',
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
                                decorationColor: _saturatedPrimaryColour,
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                color: _saturatedPrimaryColour
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
                          color: _saturatedPrimaryColour
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

      case "A - Levels":
        return SizedBox(
          width: ResponsiveUnit().width(context, 1260),
          height: ResponsiveUnit().height(context, 220),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'A - Levels Grade',
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
                    backgroundColor: _saturatedPrimaryColour,
                  ),
                )
            ),
            SizedBox(
              height: ResponsiveUnit().height(context, 64),
            ),

            SizedBox(
              width: ResponsiveUnit().width(context, 1260),
              height: ResponsiveUnit().height(context, 540),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SAT',
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
                                    decorationColor: _saturatedPrimaryColour,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36,
                                    color: _saturatedPrimaryColour
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
                              color: _saturatedPrimaryColour
                          ),
                        )
                      ],
                    ),
                  ),

                  Text(
                    'ACT',
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
                                    decorationColor: _saturatedPrimaryColour,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36,
                                    color: _saturatedPrimaryColour
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
                              color: _saturatedPrimaryColour
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
                  Navigator.pushNamed(context, '/onboarding/essay', arguments: portfolio);
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

class Essay extends StatefulWidget {
  const Essay({super.key});

  @override
  State<StatefulWidget> createState() => _EssayState();

}

class _EssayState extends State<Essay> {

  String essay = "";

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
                    value: _essayPageNum/_totalNumberOfPages,
                    backgroundColor: _saturatedPrimaryColour,
                  ),
                )
            ),
            SizedBox(
              height: ResponsiveUnit().height(context, 64),
            ),

            SizedBox(
              width: ResponsiveUnit().width(context, 1340),
              height: ResponsiveUnit().height(context, 540),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Essay',
                    style: GoogleFonts.montserrat(
                        decoration: TextDecoration.underline,
                        decorationColor: _primaryColour,
                        fontWeight: FontWeight.normal,
                        fontSize: 36,
                        color: _primaryColour
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveUnit().height(context, 36),
                  ),

                  Container(
                    width: ResponsiveUnit().width(context, 1340),
                    height: ResponsiveUnit().height(context, 430),
                    decoration: BoxDecoration(
                      border: Border.all(color: essay.isEmpty ? _saturatedPrimaryColour : _primaryColour, width: 3),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'write a 650 worded essay on any prompt of your choice',
                          hintStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: _saturatedPrimaryColour
                          ),
                          border: InputBorder.none
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      onChanged: (String inputEssay) {
                        setState(() {
                          essay = inputEssay;
                        });
                      },
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: _primaryColour
                      ),
                    )
                  )

                ],
              ),
            ),

            SizedBox(
              height: ResponsiveUnit().height(context, 64),
            ),

            InkWell(
              onTap: () {
                if(essay.isNotEmpty) {
                  portfolio["essay"] = essay;
                  
                  Navigator.pushNamed(context, '/onboarding/extra-curricular', arguments: portfolio);

                  // PortfolioApi().insertPortfolio(
                  //     Portfolio(
                  //       Auth().getUserId() as String,
                  //       portfolio["boardOfEdInTenth"] as String,
                  //       portfolio["boardOfEdInTwelfth"] as String,
                  //       portfolio["gradeInTenth"] as String,
                  //       portfolio["gradeInTwelfth"] as String,
                  //       portfolio["scoreInSat"] as int,
                  //       portfolio["scoreInAct"] as int,
                  //       portfolio["essay"] as String,
                  //       portfolio["passionProject"] as String,
                  //       portfolio["sports"] as String,
                  //       portfolio["awards"] as String
                  //     )
                  // ).then((_) {
                  //   print("success");
                  //
                  //   // todo: take to dashboard
                  //
                  // }).catchError((e) {
                  //   print(e);
                  // });
                }
              },
              child: Container(
                  width: ResponsiveUnit().width(context, 200),
                  height: ResponsiveUnit().height(context, 85),
                  decoration: BoxDecoration(
                      color: essay.isNotEmpty ? _primaryColour : _secondaryColour,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: essay.isNotEmpty ? [ _boxShadow ] : null,
                      border: Border.all(color: _primaryColour, width: 3)
                  ),
                  child: Center(
                    child: Text(
                      'next!',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: essay.isNotEmpty ? _secondaryColour : _primaryColour,
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

class ExtraCurricular extends StatefulWidget {
  const ExtraCurricular({super.key});

  @override
  State<StatefulWidget> createState() => _ExtraCurricularState();

}

class _ExtraCurricularState extends State<ExtraCurricular> {

  String passionProject = "";
  String sports = "";
  String awardsFirst = "";
  String awardsSecond = "";
  String awardsThird = "";

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
                    value: _extraCurricularPageNum/_totalNumberOfPages,
                    backgroundColor: _saturatedPrimaryColour,
                  ),
                )
            ),
            SizedBox(
              height: ResponsiveUnit().height(context, 64),
            ),
            
            SizedBox(
              width: ResponsiveUnit().width(context, 1340),
              height: ResponsiveUnit().height(context, 540),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Extra Curricular',
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

                  InkWell(
                    onTap: () {
                      _showPassionProject(context);
                    },
                    child: Container(
                      width: ResponsiveUnit().width(context, 1250),
                      height: ResponsiveUnit().width(context, 90),
                      decoration: BoxDecoration(
                        color: _primaryColour,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [ _boxShadow ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Passion Projects',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: _secondaryColour
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_rounded,
                              size: ResponsiveUnit().width(context, 48),
                              color: _secondaryColour,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveUnit().height(context, 54),
                  ),

                  InkWell(
                    onTap: () {
                      _showSports(context);
                    },
                    child: Container(
                      width: ResponsiveUnit().width(context, 1250),
                      height: ResponsiveUnit().width(context, 90),
                      decoration: BoxDecoration(
                        color: _primaryColour,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [ _boxShadow ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sports',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: _secondaryColour
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_rounded,
                              size: ResponsiveUnit().width(context, 48),
                              color: _secondaryColour,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveUnit().height(context, 54),
                  ),

                  InkWell(
                    onTap: () {
                      _showAwards(context);
                    },
                    child: Container(
                      width: ResponsiveUnit().width(context, 1250),
                      height: ResponsiveUnit().width(context, 90),
                      decoration: BoxDecoration(
                        color: _primaryColour,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [ _boxShadow ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Awards',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: _secondaryColour
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_rounded,
                              size: ResponsiveUnit().width(context, 48),
                              color: _secondaryColour,
                            )
                          ],
                        ),
                      ),
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

                portfolio["passionProject"] = passionProject;
                portfolio["sports"] = sports;
                portfolio["awards"] = "$awardsFirst \n $awardsSecond \n $awardsThird";

                // todo: essay edge functions

                /// temp
                portfolio["essay"] = 5;

                PortfolioApi().insertPortfolio(
                    Portfolio(
                      Auth().getUserId() as String,
                      portfolio["boardOfEdInTenth"] as String,
                      portfolio["boardOfEdInTwelfth"] as String,
                      portfolio["gradeInTenth"] as String,
                      portfolio["gradeInTwelfth"] as String,
                      portfolio["scoreInSat"] as int,
                      portfolio["scoreInAct"] as int,
                      portfolio["essay"] as double,
                      portfolio["passionProject"] as String,
                      portfolio["sports"] as String,
                      portfolio["awards"] as String
                    )
                ).then((_) {
                  print("success");

                  /// take to dashboard
                  // todo: new dashboard url, new route.

                }).catchError((e) {
                  print(e);
                });
              },
              child: Container(
                  width: ResponsiveUnit().width(context, 200),
                  height: ResponsiveUnit().height(context, 85),
                  decoration: BoxDecoration(
                      color: _primaryColour,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [ _boxShadow ],
                      border: Border.all(color: _primaryColour, width: 3)
                  ),
                  child: Center(
                    child: Text(
                      'next!',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: _secondaryColour,
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

  Future<void> _showPassionProject(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(75),
          ),
          elevation: 5.0,
          backgroundColor: _primaryColour,
          child: SizedBox(
            width: ResponsiveUnit().width(context, 900),
            height: ResponsiveUnit().height(context, 550),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Passion Project',
                    style: GoogleFonts.montserrat(
                      color: _secondaryColour,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      decoration: TextDecoration.underline,
                      decorationColor: _secondaryColour,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: ResponsiveUnit().height(context, 12),
                  ),
                  Text(
                    'write your most significant one',
                    style: GoogleFonts.montserrat(
                        color: const BeaconTheme().secondaryColour,
                        fontWeight: FontWeight.normal,
                        fontSize: 14
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: ResponsiveUnit().height(context, 36),
                  ),
                  Container(
                      width: ResponsiveUnit().width(context, 800),
                      height: ResponsiveUnit().height(context, 230),
                      decoration: BoxDecoration(
                          border: Border.all(color: _secondaryColour, width: 3),
                          borderRadius: BorderRadius.circular(40)
                      ),
                      padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: passionProject.isNotEmpty ? passionProject : 'describe your passion project, how long you have been working and if there was any measurable impact',
                            hintStyle: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: _secondaryColour
                            ),
                            border: InputBorder.none,
                            hintMaxLines: null,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        onChanged: (String inputPassionProject) {
                          passionProject = inputPassionProject;
                        },
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: _secondaryColour
                        ),
                      )
                  ),
                  SizedBox(
                    height: ResponsiveUnit().height(context, 32),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);

                        setState(() {});
                      },
                      child: Container(
                          width: ResponsiveUnit().width(context, 200),
                          height: ResponsiveUnit().height(context, 75),
                          decoration: BoxDecoration(
                              color: const BeaconTheme().secondaryColour,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(
                            child: Text(
                              'save',
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
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showSports(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(75),
          ),
          elevation: 5.0,
          backgroundColor: _primaryColour,
          child: SizedBox(
            width: ResponsiveUnit().width(context, 900),
            height: ResponsiveUnit().height(context, 550),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sports',
                    style: GoogleFonts.montserrat(
                      color: _secondaryColour,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      decoration: TextDecoration.underline,
                      decorationColor: _secondaryColour,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: ResponsiveUnit().height(context, 12),
                  ),
                  Text(
                    'write your top two sports achievements',
                    style: GoogleFonts.montserrat(
                        color: const BeaconTheme().secondaryColour,
                        fontWeight: FontWeight.normal,
                        fontSize: 14
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: ResponsiveUnit().height(context, 36),
                  ),
                  Container(
                      width: ResponsiveUnit().width(context, 800),
                      height: ResponsiveUnit().height(context, 230),
                      decoration: BoxDecoration(
                          border: Border.all(color: _secondaryColour, width: 3),
                          borderRadius: BorderRadius.circular(40)
                      ),
                      padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: sports.isNotEmpty ? sports : 'list down the competition names and your placement',
                          hintStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: _secondaryColour
                          ),
                          border: InputBorder.none,
                          hintMaxLines: null,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        onChanged: (String inputSports) {
                          sports = inputSports;
                        },
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: _secondaryColour
                        ),
                      )
                  ),
                  SizedBox(
                    height: ResponsiveUnit().height(context, 32),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);

                        setState(() {});
                      },
                      child: Container(
                          width: ResponsiveUnit().width(context, 200),
                          height: ResponsiveUnit().height(context, 75),
                          decoration: BoxDecoration(
                              color: const BeaconTheme().secondaryColour,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(
                            child: Text(
                              'save',
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
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showAwards(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(75),
          ),
          elevation: 5.0,
          backgroundColor: _primaryColour,
          child: SizedBox(
            width: ResponsiveUnit().width(context, 900),
            height: ResponsiveUnit().height(context, 805),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Awards',
                    style: GoogleFonts.montserrat(
                      color: _secondaryColour,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      decoration: TextDecoration.underline,
                      decorationColor: _secondaryColour,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: ResponsiveUnit().height(context, 12),
                  ),
                  Text(
                    'write your top three awards or achievements',
                    style: GoogleFonts.montserrat(
                        color: const BeaconTheme().secondaryColour,
                        fontWeight: FontWeight.normal,
                        fontSize: 14
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: ResponsiveUnit().height(context, 36),
                  ),

                  Container(
                      width: ResponsiveUnit().width(context, 800),
                      height: ResponsiveUnit().height(context, 140),
                      decoration: BoxDecoration(
                          border: Border.all(color: _secondaryColour, width: 3),
                          borderRadius: BorderRadius.circular(40)
                      ),
                      padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: awardsFirst.isNotEmpty ? awardsFirst : 'try to mention any objective data i.e went up against 1.2 mil students',
                          hintStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: _secondaryColour
                          ),
                          border: InputBorder.none,
                          hintMaxLines: null,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        onChanged: (String inputAwardsFirst) {
                          awardsFirst = inputAwardsFirst;
                        },
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: _secondaryColour
                        ),
                      )
                  ),
                  SizedBox(
                    height: ResponsiveUnit().height(context, 36),
                  ),

                  Container(
                      width: ResponsiveUnit().width(context, 800),
                      height: ResponsiveUnit().height(context, 140),
                      decoration: BoxDecoration(
                          border: Border.all(color: _secondaryColour, width: 3),
                          borderRadius: BorderRadius.circular(40)
                      ),
                      padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: awardsSecond.isNotEmpty ? awardsSecond : 'use buzz words like regional level, world’s largest, etc',
                          hintStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: _secondaryColour
                          ),
                          border: InputBorder.none,
                          hintMaxLines: null,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        onChanged: (String inputAwardsSecond) {
                          awardsSecond = inputAwardsSecond;
                        },
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: _secondaryColour
                        ),
                      )
                  ),
                  SizedBox(
                    height: ResponsiveUnit().height(context, 36),
                  ),

                  Container(
                      width: ResponsiveUnit().width(context, 800),
                      height: ResponsiveUnit().height(context, 140),
                      decoration: BoxDecoration(
                          border: Border.all(color: _secondaryColour, width: 3),
                          borderRadius: BorderRadius.circular(40)
                      ),
                      padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: awardsThird.isNotEmpty ? awardsThird : 'limit your response to 30 words in each prompt',
                          hintStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: _secondaryColour
                          ),
                          border: InputBorder.none,
                          hintMaxLines: null,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        onChanged: (String inputAwardsThird) {
                          awardsThird = inputAwardsThird;
                        },
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: _secondaryColour
                        ),
                      )
                  ),
                  SizedBox(
                    height: ResponsiveUnit().height(context, 36),
                  ),

                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);

                        setState(() {});
                      },
                      child: Container(
                          width: ResponsiveUnit().width(context, 200),
                          height: ResponsiveUnit().height(context, 75),
                          decoration: BoxDecoration(
                              color: const BeaconTheme().secondaryColour,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(
                            child: Text(
                              'save',
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
              ),
            ),
          ),
        );
      },
    );
  }

}


