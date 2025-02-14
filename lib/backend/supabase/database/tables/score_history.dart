import '../database.dart';

class ScoreHistoryTable extends SupabaseTable<ScoreHistoryRow> {
  @override
  String get tableName => 'score_history';

  @override
  ScoreHistoryRow createRow(Map<String, dynamic> data) => ScoreHistoryRow(data);
}

class ScoreHistoryRow extends SupabaseDataRow {
  ScoreHistoryRow(Map<String, dynamic> data) : super(data);

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

  int? get raison1Count => getField<int>('raison1_count');
  set raison1Count(int? value) => setField<int>('raison1_count', value);

  int? get raison2Count => getField<int>('raison2_count');
  set raison2Count(int? value) => setField<int>('raison2_count', value);

  int? get raison3Count => getField<int>('raison3_count');
  set raison3Count(int? value) => setField<int>('raison3_count', value);

  int? get raison4Count => getField<int>('raison4_count');
  set raison4Count(int? value) => setField<int>('raison4_count', value);

  int? get raison5Count => getField<int>('raison5_count');
  set raison5Count(int? value) => setField<int>('raison5_count', value);

  int? get promotRaison1Count => getField<int>('promot_raison1_count');
  set promotRaison1Count(int? value) =>
      setField<int>('promot_raison1_count', value);

  int? get promotRaison2Count => getField<int>('promot_raison2_count');
  set promotRaison2Count(int? value) =>
      setField<int>('promot_raison2_count', value);

  int? get promotRaison3Count => getField<int>('promot_raison3_count');
  set promotRaison3Count(int? value) =>
      setField<int>('promot_raison3_count', value);

  int? get promotRaison4Count => getField<int>('promot_raison4_count');
  set promotRaison4Count(int? value) =>
      setField<int>('promot_raison4_count', value);

  int? get promotRaison5Count => getField<int>('promot_raison5_count');
  set promotRaison5Count(int? value) =>
      setField<int>('promot_raison5_count', value);

  int? get detracRaison1Count => getField<int>('detrac_raison1_count');
  set detracRaison1Count(int? value) =>
      setField<int>('detrac_raison1_count', value);

  int? get detracRaison2Count => getField<int>('detrac_raison2_count');
  set detracRaison2Count(int? value) =>
      setField<int>('detrac_raison2_count', value);

  int? get detracRaison3Count => getField<int>('detrac_raison3_count');
  set detracRaison3Count(int? value) =>
      setField<int>('detrac_raison3_count', value);

  int? get detracRaison4Count => getField<int>('detrac_raison4_count');
  set detracRaison4Count(int? value) =>
      setField<int>('detrac_raison4_count', value);

  int? get detracRaison5Count => getField<int>('detrac_raison5_count');
  set detracRaison5Count(int? value) =>
      setField<int>('detrac_raison5_count', value);

  int? get passiveRaison1Count => getField<int>('passive_raison1_count');
  set passiveRaison1Count(int? value) =>
      setField<int>('passive_raison1_count', value);

  int? get passiveRaison2Count => getField<int>('passive_raison2_count');
  set passiveRaison2Count(int? value) =>
      setField<int>('passive_raison2_count', value);

  int? get passiveRaison3Count => getField<int>('passive_raison3_count');
  set passiveRaison3Count(int? value) =>
      setField<int>('passive_raison3_count', value);

  int? get passiveRaison4Count => getField<int>('passive_raison4_count');
  set passiveRaison4Count(int? value) =>
      setField<int>('passive_raison4_count', value);

  int? get passiveRaison5Count => getField<int>('passive_raison5_count');
  set passiveRaison5Count(int? value) =>
      setField<int>('passive_raison5_count', value);

  int? get buId => getField<int>('bu_id');
  set buId(int? value) => setField<int>('bu_id', value);

  int? get locId => getField<int>('loc_id');
  set locId(int? value) => setField<int>('loc_id', value);

  String? get columnType => getField<String>('column_type');
  set columnType(String? value) => setField<String>('column_type', value);
}
