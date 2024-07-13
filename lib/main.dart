import 'package:beacon/widgets/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'firebase_options.dart';

const _supabaseUrl = 'https://khccogobjdfrvgdgezws.supabase.co';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: "SUPABASE_API_KEY.env");

  await Supabase.initialize(
    url: _supabaseUrl,
    anonKey: dotenv.env['SUPABASE_API_KEY'] as String, // use dot env
  );

  runApp(const BeaconApp());
}

/// flutter run -d chrome --web-hostname localhost --web-port 7357
