import '../database.dart';

class ListsTable extends SupabaseTable<ListsRow> {
  @override
  String get tableName => 'lists';

  @override
  ListsRow createRow(Map<String, dynamic> data) => ListsRow(data);
}

class ListsRow extends SupabaseDataRow {
  ListsRow(super.data);

  @override
  SupabaseTable get table => ListsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get uuid => getField<String>('uuid');
  set uuid(String? value) => setField<String>('uuid', value);

  List<int> get selection => getListField<int>('selection');
  set selection(List<int>? value) => setListField<int>('selection', value);
}
