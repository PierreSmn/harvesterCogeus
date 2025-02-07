import '../database.dart';

class ScoreHistoryTable extends SupabaseTable<ScoreHistoryRow> {
  @override
  String get tableName => 'score_history';

  @override
  ScoreHistoryRow createRow(Map<String, dynamic> data) => ScoreHistoryRow(data);
}

class ScoreHistoryRow extends SupabaseDataRow {
  ScoreHistoryRow(super.data);

  @override
  SupabaseTable get table => ScoreHistoryTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get clientId => getField<int>('client_id')!;
  set clientId(int value) => setField<int>('client_id', value);

  DateTime? get dateRecorded => getField<DateTime>('date_recorded');
  set dateRecorded(DateTime? value) =>
      setField<DateTime>('date_recorded', value);

  double? get moyFeedbackGeneral => getField<double>('moy_feedback_general');
  set moyFeedbackGeneral(double? value) =>
      setField<double>('moy_feedback_general', value);

  double? get moyFeedback1 => getField<double>('moy_feedback_1');
  set moyFeedback1(double? value) => setField<double>('moy_feedback_1', value);

  double? get moyFeedback2 => getField<double>('moy_feedback_2');
  set moyFeedback2(double? value) => setField<double>('moy_feedback_2', value);

  double? get moyFeedback3 => getField<double>('moy_feedback_3');
  set moyFeedback3(double? value) => setField<double>('moy_feedback_3', value);

  double? get moyFeedback4 => getField<double>('moy_feedback_4');
  set moyFeedback4(double? value) => setField<double>('moy_feedback_4', value);

  int? get countPromoteurs => getField<int>('count_promoteurs');
  set countPromoteurs(int? value) => setField<int>('count_promoteurs', value);

  int? get countIndifferent => getField<int>('count_indifferent');
  set countIndifferent(int? value) => setField<int>('count_indifferent', value);

  int? get countDettracteurs => getField<int>('count_dettracteurs');
  set countDettracteurs(int? value) =>
      setField<int>('count_dettracteurs', value);

  int? get countNps => getField<int>('count_nps');
  set countNps(int? value) => setField<int>('count_nps', value);

  int? get countVideoDone => getField<int>('count_video_done');
  set countVideoDone(int? value) => setField<int>('count_video_done', value);

  int? get countReviewDone => getField<int>('count_review_done');
  set countReviewDone(int? value) => setField<int>('count_review_done', value);

  int? get countFeedbackAnswer => getField<int>('count_feedback_answer');
  set countFeedbackAnswer(int? value) =>
      setField<int>('count_feedback_answer', value);

  double? get avgNpsScore => getField<double>('avg_nps_score');
  set avgNpsScore(double? value) => setField<double>('avg_nps_score', value);

  double? get repartPromot => getField<double>('repart_promot');
  set repartPromot(double? value) => setField<double>('repart_promot', value);

  double? get repartIndif => getField<double>('repart_indif');
  set repartIndif(double? value) => setField<double>('repart_indif', value);

  double? get repartDetrac => getField<double>('repart_detrac');
  set repartDetrac(double? value) => setField<double>('repart_detrac', value);

  double? get npsScore => getField<double>('nps_score');
  set npsScore(double? value) => setField<double>('nps_score', value);

  int? get raisonConnu => getField<int>('raison_connu');
  set raisonConnu(int? value) => setField<int>('raison_connu', value);
}
