import '../database.dart';

class OffFlowsTable extends SupabaseTable<OffFlowsRow> {
  @override
  String get tableName => 'off_flows';

  @override
  OffFlowsRow createRow(Map<String, dynamic> data) => OffFlowsRow(data);
}

class OffFlowsRow extends SupabaseDataRow {
  OffFlowsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OffFlowsTable();

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

  String? get expla2 => getField<String>('expla2');
  set expla2(String? value) => setField<String>('expla2', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get slug => getField<String>('slug');
  set slug(String? value) => setField<String>('slug', value);

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

  bool? get carouselBool => getField<bool>('carousel_bool');
  set carouselBool(bool? value) => setField<bool>('carousel_bool', value);

  String? get carouselCode => getField<String>('carousel_code');
  set carouselCode(String? value) => setField<String>('carousel_code', value);

  String? get colorBG => getField<String>('colorBG');
  set colorBG(String? value) => setField<String>('colorBG', value);

  bool? get mailOnlyBool => getField<bool>('mail_only_bool');
  set mailOnlyBool(bool? value) => setField<bool>('mail_only_bool', value);
}
