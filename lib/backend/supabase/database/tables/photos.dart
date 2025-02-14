import '../database.dart';

class PhotosTable extends SupabaseTable<PhotosRow> {
  @override
  String get tableName => 'photos';

  @override
  PhotosRow createRow(Map<String, dynamic> data) => PhotosRow(data);
}

class PhotosRow extends SupabaseDataRow {
  PhotosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PhotosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get mediaLink => getField<String>('media_link');
  set mediaLink(String? value) => setField<String>('media_link', value);

  String? get album => getField<String>('album');
  set album(String? value) => setField<String>('album', value);
}
