import 'package:hive_flutter/hive_flutter.dart';
import 'package:wirdi/features/quran/data/models/ayah_model.dart';
import 'package:wirdi/features/quran/data/models/surah_model.dart';
import 'package:wirdi/features/azkar/data/models/zekr_model.dart';

class HiveService {
  static const String quranBox = 'quran_box';
  static const String azkarBox = 'azkar_box';
  static const String settingsBox = 'settings_box';
  static const String progressBox = 'progress_box';
  
  static Future<void> init() async {
    // Register adapters
    Hive.registerAdapter(SurahModelAdapter());
    Hive.registerAdapter(AyahModelAdapter());
    Hive.registerAdapter(ZekrModelAdapter());
    
    // Open boxes
    await Hive.openBox<SurahModel>(quranBox);
    await Hive.openBox<ZekrModel>(azkarBox);
    await Hive.openBox(settingsBox);
    await Hive.openBox(progressBox);
  }
  
  Box<T> getBox<T>(String boxName) {
    return Hive.box<T>(boxName);
  }
  
  Future<void> clearAll() async {
    await Hive.deleteBoxFromDisk(quranBox);
    await Hive.deleteBoxFromDisk(azkarBox);
    await Hive.deleteBoxFromDisk(settingsBox);
    await Hive.deleteBoxFromDisk(progressBox);
  }
}
