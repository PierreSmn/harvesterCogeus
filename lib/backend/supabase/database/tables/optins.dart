import '../database.dart';

class OptinsTable extends SupabaseTable<OptinsRow> {
  @override
  String get tableName => 'optins';

  @override
  OptinsRow createRow(Map<String, dynamic> data) => OptinsRow(data);
}

class OptinsRow extends SupabaseDataRow {
  OptinsRow(super.data);

  @override
  SupabaseTable get table => OptinsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get clid => getField<int>('clid');
  set clid(int? value) => setField<int>('clid', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  bool? get consent => getField<bool>('consent');
  set consent(bool? value) => setField<bool>('consent', value);
}
