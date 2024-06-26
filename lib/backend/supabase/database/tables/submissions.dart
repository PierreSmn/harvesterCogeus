import '../database.dart';

class SubmissionsTable extends SupabaseTable<SubmissionsRow> {
  @override
  String get tableName => 'submissions';

  @override
  SubmissionsRow createRow(Map<String, dynamic> data) => SubmissionsRow(data);
}

class SubmissionsRow extends SupabaseDataRow {
  SubmissionsRow(super.data);

  @override
  SupabaseTable get table => SubmissionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get mediaType => getField<String>('media_type');
  set mediaType(String? value) => setField<String>('media_type', value);

  String? get mediaLink => getField<String>('media_link');
  set mediaLink(String? value) => setField<String>('media_link', value);

  String get phoneNumber => getField<String>('phone_number')!;
  set phoneNumber(String value) => setField<String>('phone_number', value);

  String? get brandName => getField<String>('brand_name');
  set brandName(String? value) => setField<String>('brand_name', value);

  String? get submitterName => getField<String>('submitter_name');
  set submitterName(String? value) => setField<String>('submitter_name', value);

  String? get flowDone => getField<String>('flow_done');
  set flowDone(String? value) => setField<String>('flow_done', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get submitterSurname => getField<String>('submitter_surname');
  set submitterSurname(String? value) =>
      setField<String>('submitter_surname', value);

  String? get transcription => getField<String>('transcription');
  set transcription(String? value) => setField<String>('transcription', value);

  dynamic get transcriptionJson => getField<dynamic>('transcriptionJson');
  set transcriptionJson(dynamic value) =>
      setField<dynamic>('transcriptionJson', value);
}
