import 'package:aman_graduation_broject/features/auth/data/data%20sources/auth_local_data_source.dart';
import 'package:aman_graduation_broject/features/auth/data/data%20sources/auth_remote_data_source.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repositories/auth_repository.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../network/dio_client.dart';
import '../storage/secure_storage.dart';

final sl = GetIt.instance;

void setupDependencies() {
  // Core
  sl.registerLazySingleton<SecureStorage>(() => SecureStorage());
  sl.registerLazySingleton<DioClient>(() => DioClient(sl<SecureStorage>()));

  // Auth: Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(sl<DioClient>().dio),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(sl<SecureStorage>()),
  );

  // Auth: Repository (هنا بنبدّل Fake / الحقيقي)
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      sl<AuthRemoteDataSource>(),
      sl<AuthLocalDataSource>(),
    ),
  );
}