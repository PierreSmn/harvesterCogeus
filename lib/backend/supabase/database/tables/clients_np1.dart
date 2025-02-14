import '../database.dart';

class ClientsNp1Table extends SupabaseTable<ClientsNp1Row> {
  @override
  String get tableName => 'clients_np1';

  @override
  ClientsNp1Row createRow(Map<String, dynamic> data) => ClientsNp1Row(data);
}

class ClientsNp1Row extends SupabaseDataRow {
  ClientsNp1Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClientsNp1Table();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get admin => getField<String>('admin');
  set admin(String? value) => setField<String>('admin', value);

  String? get logoUrl => getField<String>('logo_url');
  set logoUrl(String? value) => setField<String>('logo_url', value);

  String? get reviewLink => getField<String>('review_link');
  set reviewLink(String? value) => setField<String>('review_link', value);

  String? get slugHarvester => getField<String>('slug_harvester');
  set slugHarvester(String? value) => setField<String>('slug_harvester', value);

  String? get theme1 => getField<String>('theme1');
  set theme1(String? value) => setField<String>('theme1', value);

  String? get theme2 => getField<String>('theme2');
  set theme2(String? value) => setField<String>('theme2', value);

  String? get theme3 => getField<String>('theme3');
  set theme3(String? value) => setField<String>('theme3', value);

  String? get theme4 => getField<String>('theme4');
  set theme4(String? value) => setField<String>('theme4', value);

  String? get reviewSite => getField<String>('review_site');
  set reviewSite(String? value) => setField<String>('review_site', value);

  String? get siteUrl => getField<String>('site_url');
  set siteUrl(String? value) => setField<String>('site_url', value);

  String? get stripeLink => getField<String>('stripeLink');
  set stripeLink(String? value) => setField<String>('stripeLink', value);

  String? get color => getField<String>('color');
  set color(String? value) => setField<String>('color', value);

  String? get subscriptionFee => getField<String>('subscriptionFee');
  set subscriptionFee(String? value) =>
      setField<String>('subscriptionFee', value);

  String? get optinText => getField<String>('optin_text');
  set optinText(String? value) => setField<String>('optin_text', value);

  String? get optinImageUrl => getField<String>('optin_image_url');
  set optinImageUrl(String? value) =>
      setField<String>('optin_image_url', value);

  bool? get activeSub => getField<bool>('active_sub');
  set activeSub(bool? value) => setField<bool>('active_sub', value);

  int? get clientPrincipalId => getField<int>('client_principal_id');
  set clientPrincipalId(int? value) =>
      setField<int>('client_principal_id', value);
}
