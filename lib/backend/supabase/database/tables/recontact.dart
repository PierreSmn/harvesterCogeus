import '../database.dart';

class RecontactTable extends SupabaseTable<RecontactRow> {
  @override
  String get tableName => 'recontact';

  @override
  RecontactRow createRow(Map<String, dynamic> data) => RecontactRow(data);
}

class RecontactRow extends SupabaseDataRow {
  RecontactRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RecontactTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  int? get nps => getField<int>('nps');
  set nps(int? value) => setField<int>('nps', value);

  String? get theme => getField<String>('theme');
  set theme(String? value) => setField<String>('theme', value);

  String? get feedback => getField<String>('feedback');
  set feedback(String? value) => setField<String>('feedback', value);

  int? get clientId => getField<int>('client_id');
  set clientId(int? value) => setField<int>('client_id', value);

  bool? get wantsContact => getField<bool>('wantsContact');
  set wantsContact(bool? value) => setField<bool>('wantsContact', value);

  String? get contactMessage => getField<String>('contactMessage');
  set contactMessage(String? value) =>
      setField<String>('contactMessage', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  String? get feedbackCustomText => getField<String>('feedback_customText');
  set feedbackCustomText(String? value) =>
      setField<String>('feedback_customText', value);

  String? get fullName => getField<String>('full_name');
  set fullName(String? value) => setField<String>('full_name', value);

  int? get expId => getField<int>('exp_id');
  set expId(int? value) => setField<int>('exp_id', value);

  int? get buId => getField<int>('bu_id');
  set buId(int? value) => setField<int>('bu_id', value);

  int? get locId => getField<int>('loc_id');
  set locId(int? value) => setField<int>('loc_id', value);

  bool? get contacted => getField<bool>('contacted');
  set contacted(bool? value) => setField<bool>('contacted', value);
}
