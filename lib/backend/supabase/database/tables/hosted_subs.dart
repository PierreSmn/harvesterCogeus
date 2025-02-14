import '../database.dart';

class HostedSubsTable extends SupabaseTable<HostedSubsRow> {
  @override
  String get tableName => 'hostedSubs';

  @override
  HostedSubsRow createRow(Map<String, dynamic> data) => HostedSubsRow(data);
}

class HostedSubsRow extends SupabaseDataRow {
  HostedSubsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HostedSubsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get mediaLink => getField<String>('media_link');
  set mediaLink(String? value) => setField<String>('media_link', value);

  String? get brandName => getField<String>('brand_name');
  set brandName(String? value) => setField<String>('brand_name', value);

  String? get owner => getField<String>('owner');
  set owner(String? value) => setField<String>('owner', value);

  String? get thumbnail => getField<String>('thumbnail');
  set thumbnail(String? value) => setField<String>('thumbnail', value);

  String? get playbackId => getField<String>('playback_id');
  set playbackId(String? value) => setField<String>('playback_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get assetId => getField<String>('asset_id');
  set assetId(String? value) => setField<String>('asset_id', value);

  String? get clipOriginId => getField<String>('clip_origin_id');
  set clipOriginId(String? value) => setField<String>('clip_origin_id', value);

  int? get clientId => getField<int>('client_id');
  set clientId(int? value) => setField<int>('client_id', value);

  String? get logoUrl => getField<String>('logo_url');
  set logoUrl(String? value) => setField<String>('logo_url', value);

  String? get linkUrl => getField<String>('link_url');
  set linkUrl(String? value) => setField<String>('link_url', value);

  String? get linkTitle => getField<String>('link_title');
  set linkTitle(String? value) => setField<String>('link_title', value);

  bool? get linkBool => getField<bool>('link_bool');
  set linkBool(bool? value) => setField<bool>('link_bool', value);

  List<int> get tagId => getListField<int>('tagId');
  set tagId(List<int>? value) => setListField<int>('tagId', value);
}
