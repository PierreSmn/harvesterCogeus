import '../database.dart';

class DailySlugActivationsCompleteTable
    extends SupabaseTable<DailySlugActivationsCompleteRow> {
  @override
  String get tableName => 'daily_slug_activations_complete';

  @override
  DailySlugActivationsCompleteRow createRow(Map<String, dynamic> data) =>
      DailySlugActivationsCompleteRow(data);
}

class DailySlugActivationsCompleteRow extends SupabaseDataRow {
  DailySlugActivationsCompleteRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DailySlugActivationsCompleteTable();

  DateTime? get activationDate => getField<DateTime>('activation_date');
  set activationDate(DateTime? value) =>
      setField<DateTime>('activation_date', value);

  String? get slug => getField<String>('slug');
  set slug(String? value) => setField<String>('slug', value);

  int? get activationCount => getField<int>('activation_count');
  set activationCount(int? value) => setField<int>('activation_count', value);
}
