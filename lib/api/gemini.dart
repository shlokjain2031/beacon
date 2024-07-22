import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GeminiApi {
  final supabase = Supabase.instance.client;

  Future<String> getEssayRating(String essayPrmopt) async {

    await dotenv.load(fileName: "SUPABASE_API_KEY.env");

    String essayRating = await supabase.functions.invoke(
      'gemini-api',
      headers: {
        "Authorization": "Bearer ${dotenv.env['SUPABASE_API_KEY'] as String}",
        "content-type": "application/json"
      },
      body: {
        "essayPrompt" : essayPrmopt
      },
    ).then((response) {
      return response.data;
    }).catchError((e) {
      print(e);
    });

    print(essayRating);

    return essayRating;
  }

// todo: safety reach list
}
