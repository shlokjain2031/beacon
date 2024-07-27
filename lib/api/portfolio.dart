import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/portfolio.dart';
import 'auth.dart';

class PortfolioApi {

  final supabase = Supabase.instance.client;

  Future<PostgrestFilterBuilder> insertPortfolio(Portfolio portfolio) async {
    return await supabase.from('portfolios').insert(
      {
        'user_id' : portfolio.userId,
        'board_of_education_in_tenth' : portfolio.boardOfEdInTenth,
        'board_of_education_in_twelfth' : portfolio.boardOfEdInTwelfth,
        'grade_in_tenth' : portfolio.gradeInTenth,
        'grade_in_twelfth' : portfolio.gradeInTwelfth,
        'score_in_sat' : portfolio.scoreInSat,
        'score_in_act' : portfolio.scoreInAct,
        'essay_score' : portfolio.essayScore,
        'passion_project' : portfolio.passionProject,
        'sports' : portfolio.sports,
        'awards' : portfolio.awards
      }
    );
  }

  /// todo: edit parts of portfolio

  /// todo: delete option


}