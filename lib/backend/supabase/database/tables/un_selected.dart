import '../database.dart';

class UnSelectedTable extends SupabaseTable<UnSelectedRow> {
  @override
  String get tableName => 'un_selected';

  @override
  UnSelectedRow createRow(Map<String, dynamic> data) => UnSelectedRow(data);
}

class UnSelectedRow extends SupabaseDataRow {
  UnSelectedRow(super.data);

  @override
  SupabaseTable get table => UnSelectedTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get mediaType => getField<String>('media_type');
  set mediaType(String? value) => setField<String>('media_type', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  String? get mediaLink => getField<String>('media_link');
  set mediaLink(String? value) => setField<String>('media_link', value);

  String? get brandName => getField<String>('brand_name');
  set brandName(String? value) => setField<String>('brand_name', value);

  String? get submitterName => getField<String>('submitter_name');
  set submitterName(String? value) => setField<String>('submitter_name', value);

  String? get flowDone => getField<String>('flow_done');
  set flowDone(String? value) => setField<String>('flow_done', value);
}
