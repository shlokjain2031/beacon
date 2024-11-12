import 'dart:convert';

import 'package:beacon/api/auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GeminiApi {
  final supabase = Supabase.instance.client;

  // todo: try to figure out a way to store portfolio in cache and get that locally

  Future<String> getEssayRating(String essayPrmopt) async {

    await dotenv.load(fileName: "SUPABASE_API_KEY.env");

    return await supabase.functions.invoke(
      'essay-prompt',
      headers: {
        "Authorization": "Bearer ${dotenv.env['SUPABASE_API_KEY'] as String}",
        "content-type": "application/json"
      },
      body: {
        "essayPrompt" : essayPrmopt
      },
    ).then((response) {
      Map<dynamic, dynamic> mapResponse = Map.from(response.data);; // import 'dart:convert';
      print("essayScore: ${mapResponse["essayScore"]}");
      return mapResponse["essayScore"];
    }).catchError((e) {
      print(e);
    });
  }

  final _userId = Auth().userId;

  Future<Map<dynamic, dynamic>> get basicSafetyReachList async {

    await dotenv.load(fileName: "SUPABASE_API_KEY.env");

    return await supabase.functions.invoke(
      'build-basic-safety-reach-list',
      headers: {
        "Authorization": "Bearer ${dotenv.env['SUPABASE_API_KEY'] as String}",
        "content-type": "application/json"
      },
      body: {
        "userId" : _userId
      }
    ).then((response) {
      Map<dynamic, dynamic> mapResponse = Map.from(response.data);
      Map<dynamic, dynamic> safetyReachList = Map.from(mapResponse);

      return safetyReachList;
    });
  }
}
