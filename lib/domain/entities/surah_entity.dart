// surah_entity.dart
class SurahEntity {
  final int id;
  final String nameAr;
  final String nameEn;
  final String transliteration;
  final int totalAyahs;
  final int startPage;

  const SurahEntity({
    required this.id, required this.nameAr, required this.nameEn,
    required this.transliteration, required this.totalAyahs, required this.startPage,
  });
}

// ayah_entity.dart
class AyahEntity {
  final int id;
  final int surahId;
  final int ayahNumber;
  final String textUthmani;
  final String textSimple;
  final int pageNumber;
  final int juzNumber;

  const AyahEntity({
    required this.id, required this.surahId, required this.ayahNumber,
    required this.textUthmani, required this.textSimple, 
    required this.pageNumber, required this.juzNumber,
  });
}