import '../database.dart';

class TrustpilotFullTable extends SupabaseTable<TrustpilotFullRow> {
  @override
  String get tableName => 'trustpilot_full';

  @override
  TrustpilotFullRow createRow(Map<String, dynamic> data) =>
      TrustpilotFullRow(data);
}

class TrustpilotFullRow extends SupabaseDataRow {
  TrustpilotFullRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrustpilotFullTable();

  String get trustpilotLink => getField<String>('trustpilot_link')!;
  set trustpilotLink(String value) =>
      setField<String>('trustpilot_link', value);

  String? get businessName => getField<String>('business_name');
  set businessName(String? value) => setField<String>('business_name', value);

  double? get aggregateRating => getField<double>('aggregate_rating');
  set aggregateRating(double? value) =>
      setField<double>('aggregate_rating', value);

  int? get aggregateCount => getField<int>('aggregate_count');
  set aggregateCount(int? value) => setField<int>('aggregate_count', value);

  String? get review1Author => getField<String>('review1_author');
  set review1Author(String? value) => setField<String>('review1_author', value);

  DateTime? get review1DatePublished =>
      getField<DateTime>('review1_date_published');
  set review1DatePublished(DateTime? value) =>
      setField<DateTime>('review1_date_published', value);

  String? get review1Headline => getField<String>('review1_headline');
  set review1Headline(String? value) =>
      setField<String>('review1_headline', value);

  String? get review1Body => getField<String>('review1_body');
  set review1Body(String? value) => setField<String>('review1_body', value);

  int? get review1Rating => getField<int>('review1_rating');
  set review1Rating(int? value) => setField<int>('review1_rating', value);

  String? get review2Author => getField<String>('review2_author');
  set review2Author(String? value) => setField<String>('review2_author', value);

  DateTime? get review2DatePublished =>
      getField<DateTime>('review2_date_published');
  set review2DatePublished(DateTime? value) =>
      setField<DateTime>('review2_date_published', value);

  String? get review2Headline => getField<String>('review2_headline');
  set review2Headline(String? value) =>
      setField<String>('review2_headline', value);

  String? get review2Body => getField<String>('review2_body');
  set review2Body(String? value) => setField<String>('review2_body', value);

  int? get review2Rating => getField<int>('review2_rating');
  set review2Rating(int? value) => setField<int>('review2_rating', value);

  String? get review3Author => getField<String>('review3_author');
  set review3Author(String? value) => setField<String>('review3_author', value);

  DateTime? get review3DatePublished =>
      getField<DateTime>('review3_date_published');
  set review3DatePublished(DateTime? value) =>
      setField<DateTime>('review3_date_published', value);

  String? get review3Headline => getField<String>('review3_headline');
  set review3Headline(String? value) =>
      setField<String>('review3_headline', value);

  String? get review3Body => getField<String>('review3_body');
  set review3Body(String? value) => setField<String>('review3_body', value);

  int? get review3Rating => getField<int>('review3_rating');
  set review3Rating(int? value) => setField<int>('review3_rating', value);

  String? get review4Author => getField<String>('review4_author');
  set review4Author(String? value) => setField<String>('review4_author', value);

  DateTime? get review4DatePublished =>
      getField<DateTime>('review4_date_published');
  set review4DatePublished(DateTime? value) =>
      setField<DateTime>('review4_date_published', value);

  String? get review4Headline => getField<String>('review4_headline');
  set review4Headline(String? value) =>
      setField<String>('review4_headline', value);

  String? get review4Body => getField<String>('review4_body');
  set review4Body(String? value) => setField<String>('review4_body', value);

  int? get review4Rating => getField<int>('review4_rating');
  set review4Rating(int? value) => setField<int>('review4_rating', value);

  String? get review5Author => getField<String>('review5_author');
  set review5Author(String? value) => setField<String>('review5_author', value);

  DateTime? get review5DatePublished =>
      getField<DateTime>('review5_date_published');
  set review5DatePublished(DateTime? value) =>
      setField<DateTime>('review5_date_published', value);

  String? get review5Headline => getField<String>('review5_headline');
  set review5Headline(String? value) =>
      setField<String>('review5_headline', value);

  String? get review5Body => getField<String>('review5_body');
  set review5Body(String? value) => setField<String>('review5_body', value);

  int? get review5Rating => getField<int>('review5_rating');
  set review5Rating(int? value) => setField<int>('review5_rating', value);
}
