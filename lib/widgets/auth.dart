import 'package:beacon/model/auth.dart';
import 'package:beacon/widgets/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BeaconTheme().primaryBackgroundColour,
      body: Center(
        child: InkWell(
          onTap: () {
            Auth().handleSignIn().then((UserCredential userCred) {
              Navigator.pushNamed(context, '/onboarding');
            });
          },
          child: Container(
            width: 250,
            height: 120,
            decoration: BoxDecoration(
              color: const BeaconTheme().primaryFontColour
            ),
            child: Text(
                'google account sign in',
              style: TextStyle(
                color: const BeaconTheme().primaryBackgroundColour
              ),
            ),
          ),
        ),
      ),
    );
  }

}