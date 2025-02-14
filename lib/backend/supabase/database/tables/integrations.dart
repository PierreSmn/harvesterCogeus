import '../database.dart';

class IntegrationsTable extends SupabaseTable<IntegrationsRow> {
  @override
  String get tableName => 'integrations';

  @override
  IntegrationsRow createRow(Map<String, dynamic> data) => IntegrationsRow(data);
}

class IntegrationsRow extends SupabaseDataRow {
  IntegrationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => IntegrationsTable();

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

  int? get vid1 => getField<int>('vid1');
  set vid1(int? value) => setField<int>('vid1', value);

  int? get vid2 => getField<int>('vid2');
  set vid2(int? value) => setField<int>('vid2', value);

  int? get vid3 => getField<int>('vid3');
  set vid3(int? value) => setField<int>('vid3', value);

  int? get vid4 => getField<int>('vid4');
  set vid4(int? value) => setField<int>('vid4', value);

  int? get vid5 => getField<int>('vid5');
  set vid5(int? value) => setField<int>('vid5', value);

  bool? get isStory => getField<bool>('is_story');
  set isStory(bool? value) => setField<bool>('is_story', value);

  String? get ownerBrand => getField<String>('ownerBrand');
  set ownerBrand(String? value) => setField<String>('ownerBrand', value);

  String? get title1 => getField<String>('title1');
  set title1(String? value) => setField<String>('title1', value);

  String? get title2 => getField<String>('title2');
  set title2(String? value) => setField<String>('title2', value);

  String? get title3 => getField<String>('title3');
  set title3(String? value) => setField<String>('title3', value);

  bool? get isFounder => getField<bool>('is_founder');
  set isFounder(bool? value) => setField<bool>('is_founder', value);
}
