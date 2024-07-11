import 'package:beacon/widgets/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'firebase_options.dart';

const _supabaseUrl = 'https://khccogobjdfrvgdgezws.supabase.co';
const _supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtoY2NvZ29iamRmcnZnZGdlendzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjAzMzczMDgsImV4cCI6MjAzNTkxMzMwOH0.WSQ3G7g2WHFdG4nbh0cQM4it7nPHvnbL6euYp4ywt-A';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: _supabaseUrl,
    anonKey: _supabaseAnonKey,
  );

  runApp(const BeaconApp());
}

// flutter run -d chrome --web-hostname localhost --web-port 7357
