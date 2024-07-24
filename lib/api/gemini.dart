import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GeminiApi {
  final supabase = Supabase.instance.client;

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
      Map<dynamic, dynamic> map = Map.from(response.data);; // import 'dart:convert';
      print("essayScore: ${map["essayScore"]}");
      return map["essayScore"];
    }).catchError((e) {
      print(e);
    });
  }

// todo: safety reach list
}
