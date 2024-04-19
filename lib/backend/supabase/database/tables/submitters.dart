import '../database.dart';

class SubmittersTable extends SupabaseTable<SubmittersRow> {
  @override
  String get tableName => 'submitters';

  @override
  SubmittersRow createRow(Map<String, dynamic> data) => SubmittersRow(data);
}

class SubmittersRow extends SupabaseDataRow {
  SubmittersRow(super.data);

  @override
  SupabaseTable get table => SubmittersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomMarque => getField<String>('nom_marque');
  set nomMarque(String? value) => setField<String>('nom_marque', value);

  String? get nomCadeau => getField<String>('nom_cadeau');
  set nomCadeau(String? value) => setField<String>('nom_cadeau', value);

  String? get imageCadeauUrl => getField<String>('image_cadeau_url');
  set imageCadeauUrl(String? value) =>
      setField<String>('image_cadeau_url', value);

  String? get option1 => getField<String>('option1');
  set option1(String? value) => setField<String>('option1', value);

  String? get option2 => getField<String>('option2');
  set option2(String? value) => setField<String>('option2', value);

  String? get explain1 => getField<String>('explain1');
  set explain1(String? value) => setField<String>('explain1', value);

  String? get explain2 => getField<String>('explain2');
  set explain2(String? value) => setField<String>('explain2', value);

  String get phoneNumber => getField<String>('phone_number')!;
  set phoneNumber(String value) => setField<String>('phone_number', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get assistant => getField<String>('assistant');
  set assistant(String? value) => setField<String>('assistant', value);

  String? get thread => getField<String>('thread');
  set thread(String? value) => setField<String>('thread', value);

  String? get flowDone => getField<String>('flow_done');
  set flowDone(String? value) => setField<String>('flow_done', value);

  String? get chathook => getField<String>('chathook');
  set chathook(String? value) => setField<String>('chathook', value);

  DateTime? get modifiedLast => getField<DateTime>('modified_last');
  set modifiedLast(DateTime? value) =>
      setField<DateTime>('modified_last', value);

  String? get promocode => getField<String>('promocode');
  set promocode(String? value) => setField<String>('promocode', value);

  bool? get content => getField<bool>('content');
  set content(bool? value) => setField<bool>('content', value);

  String? get relance => getField<String>('relance');
  set relance(String? value) => setField<String>('relance', value);
}
