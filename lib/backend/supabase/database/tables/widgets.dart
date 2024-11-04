import '../database.dart';

class WidgetsTable extends SupabaseTable<WidgetsRow> {
  @override
  String get tableName => 'widgets';

  @override
  WidgetsRow createRow(Map<String, dynamic> data) => WidgetsRow(data);
}

class WidgetsRow extends SupabaseDataRow {
  WidgetsRow(super.data);

  @override
  SupabaseTable get table => WidgetsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get uuid => getField<String>('uuid');
  set uuid(String? value) => setField<String>('uuid', value);

  String? get ownerBrand => getField<String>('owner_brand');
  set ownerBrand(String? value) => setField<String>('owner_brand', value);

  int? get clientId => getField<int>('client_id');
  set clientId(int? value) => setField<int>('client_id', value);

  String? get widgetTitle => getField<String>('widget_title');
  set widgetTitle(String? value) => setField<String>('widget_title', value);
}
