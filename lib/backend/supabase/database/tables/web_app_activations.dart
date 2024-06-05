import '../database.dart';

class WebAppActivationsTable extends SupabaseTable<WebAppActivationsRow> {
  @override
  String get tableName => 'webAppActivations';

  @override
  WebAppActivationsRow createRow(Map<String, dynamic> data) =>
      WebAppActivationsRow(data);
}

class WebAppActivationsRow extends SupabaseDataRow {
  WebAppActivationsRow(super.data);

  @override
  SupabaseTable get table => WebAppActivationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get brandName => getField<String>('brandName');
  set brandName(String? value) => setField<String>('brandName', value);

  String? get slug => getField<String>('slug');
  set slug(String? value) => setField<String>('slug', value);
}
