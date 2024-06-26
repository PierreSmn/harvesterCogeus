import '../database.dart';

class HostedSubsTable extends SupabaseTable<HostedSubsRow> {
  @override
  String get tableName => 'hostedSubs';

  @override
  HostedSubsRow createRow(Map<String, dynamic> data) => HostedSubsRow(data);
}

class HostedSubsRow extends SupabaseDataRow {
  HostedSubsRow(super.data);

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
}
