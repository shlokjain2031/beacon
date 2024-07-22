import 'package:beacon/model/portfolio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GeminiApi {
  final supabase = Supabase.instance.client;

  Future<double> getEssayRating(Portfolio portfolio) async {
    return await supabase.functions.invoke(
      'gemini-api',
      headers: {
        "Authorization": "ACCESS_TOKEN",
        "content-type": "application/json"
      },
      body: {
        // todo: include the essay
      },
    ).then((response) {
      return response.data;
    });
  }

  // todo: safety reach list
}
