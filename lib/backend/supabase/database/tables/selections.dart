import '../database.dart';

class SelectionsTable extends SupabaseTable<SelectionsRow> {
  @override
  String get tableName => 'selections';

  @override
  SelectionsRow createRow(Map<String, dynamic> data) => SelectionsRow(data);
}

class SelectionsRow extends SupabaseDataRow {
  SelectionsRow(super.data);

  @override
  SupabaseTable get table => SelectionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  List<String> get videoArray => getListField<String>('videoArray');
  set videoArray(List<String>? value) =>
      setListField<String>('videoArray', value);
}
