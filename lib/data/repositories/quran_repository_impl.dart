import 'package:quran_comprehensive/core/database/quran_database.dart';
import 'package:quran_comprehensive/domain/entities/surah_entity.dart';
import 'package:quran_comprehensive/domain/entities/ayah_entity.dart';
import 'package:quran_comprehensive/domain/repositories/quran_repository.dart';

class QuranRepositoryImpl implements QuranRepository {
  final QuranDatabase _db;

  QuranRepositoryImpl(this._db);

  @override
  Future<List<SurahEntity>> getAllSurahs() async {
    final db = await _db.database;
    final maps = await db.query('surahs', orderBy: 'id ASC');
    return List.generate(maps.length, (i) => SurahEntity(
      id: maps[i]['id'], nameAr: maps[i]['name_ar'], nameEn: maps[i]['name_en'],
      transliteration: maps[i]['transliteration'], totalAyahs: maps[i]['total_ayahs'],
      startPage: maps[i]['start_page'],
    ));
  }

  @override
  Future<List<AyahEntity>> getAyahsBySurah(int surahId) async {
    final db = await _db.database;
    final maps = await db.query('ayahs', where: 'surah_id = ?', whereArgs: [surahId], orderBy: 'ayah_number ASC');
    return List.generate(maps.length, (i) => AyahEntity(
      id: maps[i]['id'], surahId: maps[i]['surah_id'], ayahNumber: maps[i]['ayah_number'],
      textUthmani: maps[i]['text_uthmani'], textSimple: maps[i]['text_simple'],
      pageNumber: maps[i]['page_number'], juzNumber: maps[i]['juz_number'],
    ));
  }
}