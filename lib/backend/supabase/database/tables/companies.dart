import '../database.dart';

class CompaniesTable extends SupabaseTable<CompaniesRow> {
  @override
  String get tableName => 'companies';

  @override
  CompaniesRow createRow(Map<String, dynamic> data) => CompaniesRow(data);
}

class CompaniesRow extends SupabaseDataRow {
  CompaniesRow(super.data);

  @override
  SupabaseTable get table => CompaniesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  List<String> get flows => getListField<String>('flows');
  set flows(List<String>? value) => setListField<String>('flows', value);

  List<String> get admins => getListField<String>('admins');
  set admins(List<String>? value) => setListField<String>('admins', value);
}
