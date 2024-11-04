import '../database.dart';

class ExperiencesTable extends SupabaseTable<ExperiencesRow> {
  @override
  String get tableName => 'experiences';

  @override
  ExperiencesRow createRow(Map<String, dynamic> data) => ExperiencesRow(data);
}

class ExperiencesRow extends SupabaseDataRow {
  ExperiencesRow(super.data);

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
}
