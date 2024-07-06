import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  /// The scopes required by this application.
// #docregion Initialize
  static const List<String> scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: 'your-client_id.apps.googleusercontent.com',
    // scopes: scopes,
  );

  Future<UserCredential> handleSignIn() async {
    // GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signInSilently();
    // GoogleSignInAuthentication? googleAuth = await googleSignInAccount?.authentication;
    //
    // // Create a new credential
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );
    //
    // print(credential.idToken);
    //
    // // Once signed in, return the UserCredential
    // return await FirebaseAuth.instance.signInWithCredential(credential);

    GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
    return await FirebaseAuth.instance.signInWithPopup(googleAuthProvider);
  }


}