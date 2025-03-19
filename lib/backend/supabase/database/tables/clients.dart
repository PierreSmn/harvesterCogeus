import '../database.dart';

class ClientsTable extends SupabaseTable<ClientsRow> {
  @override
  String get tableName => 'clients';

  @override
  ClientsRow createRow(Map<String, dynamic> data) => ClientsRow(data);
}

class ClientsRow extends SupabaseDataRow {
  ClientsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClientsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get logoUrl => getField<String>('logo_url');
  set logoUrl(String? value) => setField<String>('logo_url', value);

  String? get reviewLink => getField<String>('review_link');
  set reviewLink(String? value) => setField<String>('review_link', value);

  String? get slugHarvester => getField<String>('slug_harvester');
  set slugHarvester(String? value) => setField<String>('slug_harvester', value);

  String? get theme1 => getField<String>('theme1');
  set theme1(String? value) => setField<String>('theme1', value);

  String? get theme2 => getField<String>('theme2');
  set theme2(String? value) => setField<String>('theme2', value);

  String? get theme3 => getField<String>('theme3');
  set theme3(String? value) => setField<String>('theme3', value);

  String? get theme4 => getField<String>('theme4');
  set theme4(String? value) => setField<String>('theme4', value);

  String? get reviewSite => getField<String>('review_site');
  set reviewSite(String? value) => setField<String>('review_site', value);

  String? get siteUrl => getField<String>('site_url');
  set siteUrl(String? value) => setField<String>('site_url', value);

  String? get stripeLink => getField<String>('stripeLink');
  set stripeLink(String? value) => setField<String>('stripeLink', value);

  String? get color => getField<String>('color');
  set color(String? value) => setField<String>('color', value);

  String? get subscriptionFee => getField<String>('subscriptionFee');
  set subscriptionFee(String? value) =>
      setField<String>('subscriptionFee', value);

  String? get optinText => getField<String>('optin_text');
  set optinText(String? value) => setField<String>('optin_text', value);

  String? get optinImageUrl => getField<String>('optin_image_url');
  set optinImageUrl(String? value) =>
      setField<String>('optin_image_url', value);

  bool? get activeSub => getField<bool>('active_sub');
  set activeSub(bool? value) => setField<bool>('active_sub', value);

  int? get np1Id => getField<int>('np1_id');
  set np1Id(int? value) => setField<int>('np1_id', value);

  int? get np2Id => getField<int>('np2_id');
  set np2Id(int? value) => setField<int>('np2_id', value);

  int? get brandId => getField<int>('brand_id');
  set brandId(int? value) => setField<int>('brand_id', value);

  int? get buId => getField<int>('bu_id');
  set buId(int? value) => setField<int>('bu_id', value);

  int? get locId => getField<int>('loc_id');
  set locId(int? value) => setField<int>('loc_id', value);

  String? get notificationEmail => getField<String>('notification_email');
  set notificationEmail(String? value) =>
      setField<String>('notification_email', value);

  String? get medium => getField<String>('medium');
  set medium(String? value) => setField<String>('medium', value);

  String? get emailTool => getField<String>('email_tool');
  set emailTool(String? value) => setField<String>('email_tool', value);

  double? get noteAvis => getField<double>('note_avis');
  set noteAvis(double? value) => setField<double>('note_avis', value);

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

  int? get countVideoNotDone => getField<int>('count_video_not_done');
  set countVideoNotDone(int? value) =>
      setField<int>('count_video_not_done', value);

  int? get countReviewNotDone => getField<int>('count_review_not_done');
  set countReviewNotDone(int? value) =>
      setField<int>('count_review_not_done', value);

  int? get countFeedbackNotAnswered =>
      getField<int>('count_feedback_not_answered');
  set countFeedbackNotAnswered(int? value) =>
      setField<int>('count_feedback_not_answered', value);

  int? get totalPromoters => getField<int>('total_promoters');
  set totalPromoters(int? value) => setField<int>('total_promoters', value);

  int? get totalIndifferent => getField<int>('total_indifferent');
  set totalIndifferent(int? value) => setField<int>('total_indifferent', value);

  int? get totalDetractors => getField<int>('total_detractors');
  set totalDetractors(int? value) => setField<int>('total_detractors', value);

  bool? get hasWidgetTp => getField<bool>('has_widget_tp');
  set hasWidgetTp(bool? value) => setField<bool>('has_widget_tp', value);

  String? get widgetTpLink => getField<String>('widget_tp_link');
  set widgetTpLink(String? value) => setField<String>('widget_tp_link', value);
}
