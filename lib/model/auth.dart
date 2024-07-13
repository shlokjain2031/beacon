import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Auth {
  /// The scopes required by this application.
// #docregion Initialize
  static const List<String> scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  final supabase = Supabase.instance.client;

  /// TODO: migrate authentication to supabase

  Future<UserCredential> handleSignIn() async {
    GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();

    return await FirebaseAuth.instance.signInWithPopup(googleAuthProvider);
  }

  Future<PostgrestFilterBuilder> insertUserIntoDb() async {
    UserCredential userCred = await handleSignIn();

    String? id = userCred.user?.uid;
    String? name = userCred.user?.displayName;

    return await supabase.from('users').insert({ 'user_id' : id, 'name' : name });
  }

  String? getUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }
}