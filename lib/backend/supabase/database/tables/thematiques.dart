import '../database.dart';

class ThematiquesTable extends SupabaseTable<ThematiquesRow> {
  @override
  String get tableName => 'thematiques';

  @override
  ThematiquesRow createRow(Map<String, dynamic> data) => ThematiquesRow(data);
}

class ThematiquesRow extends SupabaseDataRow {
  ThematiquesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ThematiquesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get titre => getField<String>('titre');
  set titre(String? value) => setField<String>('titre', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get initials => getField<String>('initials');
  set initials(String? value) => setField<String>('initials', value);

  String? get color => getField<String>('color');
  set color(String? value) => setField<String>('color', value);
}
