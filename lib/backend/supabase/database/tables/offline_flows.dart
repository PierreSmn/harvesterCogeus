import '../database.dart';

class OfflineFlowsTable extends SupabaseTable<OfflineFlowsRow> {
  @override
  String get tableName => 'offline_flows';

  @override
  OfflineFlowsRow createRow(Map<String, dynamic> data) => OfflineFlowsRow(data);
}

class OfflineFlowsRow extends SupabaseDataRow {
  OfflineFlowsRow(super.data);

  @override
  SupabaseTable get table => OfflineFlowsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get brandName => getField<String>('brand_name');
  set brandName(String? value) => setField<String>('brand_name', value);

  String? get giftName => getField<String>('gift_name');
  set giftName(String? value) => setField<String>('gift_name', value);

  String? get giftImageLink => getField<String>('gift_image_link');
  set giftImageLink(String? value) =>
      setField<String>('gift_image_link', value);

  String? get option1 => getField<String>('option1');
  set option1(String? value) => setField<String>('option1', value);

  String? get option2 => getField<String>('option2');
  set option2(String? value) => setField<String>('option2', value);

  String? get expla1 => getField<String>('expla1');
  set expla1(String? value) => setField<String>('expla1', value);

  String? get expla2 => getField<String>('expla2');
  set expla2(String? value) => setField<String>('expla2', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get webflowId => getField<String>('webflow_id');
  set webflowId(String? value) => setField<String>('webflow_id', value);

  String? get endMessage => getField<String>('end_message');
  set endMessage(String? value) => setField<String>('end_message', value);

  String? get codePromo => getField<String>('codePromo');
  set codePromo(String? value) => setField<String>('codePromo', value);

  String? get descriptionCodePromo => getField<String>('descriptionCodePromo');
  set descriptionCodePromo(String? value) =>
      setField<String>('descriptionCodePromo', value);
}
