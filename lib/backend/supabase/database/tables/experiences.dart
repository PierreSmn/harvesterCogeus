import '../database.dart';

class ExperiencesTable extends SupabaseTable<ExperiencesRow> {
  @override
  String get tableName => 'experiences';

  @override
  ExperiencesRow createRow(Map<String, dynamic> data) => ExperiencesRow(data);
}

class ExperiencesRow extends SupabaseDataRow {
  ExperiencesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ExperiencesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  int? get nps => getField<int>('nps');
  set nps(int? value) => setField<int>('nps', value);

  String? get theme => getField<String>('theme');
  set theme(String? value) => setField<String>('theme', value);

  String? get feedback => getField<String>('feedback');
  set feedback(String? value) => setField<String>('feedback', value);

  bool? get reviewDone => getField<bool>('review_done');
  set reviewDone(bool? value) => setField<bool>('review_done', value);

  bool? get videoDone => getField<bool>('video_done');
  set videoDone(bool? value) => setField<bool>('video_done', value);

  int? get clientId => getField<int>('client_id');
  set clientId(int? value) => setField<int>('client_id', value);

  bool? get wantsContact => getField<bool>('wantsContact');
  set wantsContact(bool? value) => setField<bool>('wantsContact', value);

  String? get contactMessage => getField<String>('contactMessage');
  set contactMessage(String? value) =>
      setField<String>('contactMessage', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  int? get feedbackGeneral => getField<int>('feedback_general');
  set feedbackGeneral(int? value) => setField<int>('feedback_general', value);

  int? get feedback1 => getField<int>('feedback_1');
  set feedback1(int? value) => setField<int>('feedback_1', value);

  int? get feedback2 => getField<int>('feedback_2');
  set feedback2(int? value) => setField<int>('feedback_2', value);

  int? get feedback3 => getField<int>('feedback_3');
  set feedback3(int? value) => setField<int>('feedback_3', value);

  int? get feedback4 => getField<int>('feedback_4');
  set feedback4(int? value) => setField<int>('feedback_4', value);

  bool? get feedbackAnswer => getField<bool>('feedback_answer');
  set feedbackAnswer(bool? value) => setField<bool>('feedback_answer', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  String? get feedbackCustomText => getField<String>('feedback_customText');
  set feedbackCustomText(String? value) =>
      setField<String>('feedback_customText', value);

  String? get fullName => getField<String>('full_name');
  set fullName(String? value) => setField<String>('full_name', value);

  int? get np1Id => getField<int>('np1_id');
  set np1Id(int? value) => setField<int>('np1_id', value);

  int? get np2Id => getField<int>('np2_id');
  set np2Id(int? value) => setField<int>('np2_id', value);

  int? get buId => getField<int>('bu_id');
  set buId(int? value) => setField<int>('bu_id', value);

  int? get locId => getField<int>('loc_id');
  set locId(int? value) => setField<int>('loc_id', value);

  int? get themeChoice => getField<int>('theme_choice');
  set themeChoice(int? value) => setField<int>('theme_choice', value);

  String? get product => getField<String>('product');
  set product(String? value) => setField<String>('product', value);

  String? get orderId => getField<String>('orderId');
  set orderId(String? value) => setField<String>('orderId', value);
}
