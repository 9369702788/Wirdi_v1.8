import 'package:get_it/get_it.dart';
import 'package:wirdi/core/services/storage/hive_service.dart';
import 'package:wirdi/features/quran/data/datasources/quran_local_datasource.dart';
import 'package:wirdi/features/quran/data/repositories/quran_repository_impl.dart';
import 'package:wirdi/features/quran/domain/repositories/quran_repository.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Core Services
  getIt.registerLazySingleton<HiveService>(() => HiveService());
  
  // Data Sources
  getIt.registerLazySingleton<QuranLocalDataSource>(
    () => QuranLocalDataSourceImpl()
  );
  
  // Repositories
  getIt.registerLazySingleton<QuranRepository>(
    () => QuranRepositoryImpl(
      localDataSource: getIt<QuranLocalDataSource>(),
    )
  );
  
  // Use Cases will be registered here
  
  // View Models / Notifiers will be registered here
}
