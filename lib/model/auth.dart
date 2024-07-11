import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  /// The scopes required by this application.
// #docregion Initialize
  static const List<String> scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  /// TODO: migrate authentication to supabase

  Future<UserCredential> handleSignIn() async {
    GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
    return await FirebaseAuth.instance.signInWithPopup(googleAuthProvider);
  }



}