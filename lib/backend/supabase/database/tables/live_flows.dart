import '../database.dart';

class LiveFlowsTable extends SupabaseTable<LiveFlowsRow> {
  @override
  String get tableName => 'live_flows';

  @override
  LiveFlowsRow createRow(Map<String, dynamic> data) => LiveFlowsRow(data);
}

class LiveFlowsRow extends SupabaseDataRow {
  LiveFlowsRow(super.data);

  @override
  SupabaseTable get table => LiveFlowsTable();

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

  String? get slug => getField<String>('slug');
  set slug(String? value) => setField<String>('slug', value);

  String? get expla3 => getField<String>('expla3');
  set expla3(String? value) => setField<String>('expla3', value);

  String? get webhookURL => getField<String>('webhookURL');
  set webhookURL(String? value) => setField<String>('webhookURL', value);

  String? get endMessage => getField<String>('end_message');
  set endMessage(String? value) => setField<String>('end_message', value);

  String? get assistant => getField<String>('assistant');
  set assistant(String? value) => setField<String>('assistant', value);

  String? get chathook => getField<String>('chathook');
  set chathook(String? value) => setField<String>('chathook', value);

  String? get qrId => getField<String>('qr_id');
  set qrId(String? value) => setField<String>('qr_id', value);

  String? get logoUrl => getField<String>('logoUrl');
  set logoUrl(String? value) => setField<String>('logoUrl', value);

  String? get colorButton => getField<String>('colorButton');
  set colorButton(String? value) => setField<String>('colorButton', value);

  String? get colorTitle => getField<String>('colorTitle');
  set colorTitle(String? value) => setField<String>('colorTitle', value);

  String? get colorText => getField<String>('colorText');
  set colorText(String? value) => setField<String>('colorText', value);

  String? get colorButtonText => getField<String>('colorButtonText');
  set colorButtonText(String? value) =>
      setField<String>('colorButtonText', value);

  String? get codePromo => getField<String>('codePromo');
  set codePromo(String? value) => setField<String>('codePromo', value);

  String? get descriptionCodePromo => getField<String>('descriptionCodePromo');
  set descriptionCodePromo(String? value) =>
      setField<String>('descriptionCodePromo', value);

  String? get ctaUrl => getField<String>('ctaUrl');
  set ctaUrl(String? value) => setField<String>('ctaUrl', value);

  int? get cameraSelect => getField<int>('cameraSelect');
  set cameraSelect(int? value) => setField<int>('cameraSelect', value);

  bool? get twogifts => getField<bool>('twogifts');
  set twogifts(bool? value) => setField<bool>('twogifts', value);
}
