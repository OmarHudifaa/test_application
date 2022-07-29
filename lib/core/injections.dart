import 'package:asset_people_application/core/data/app_shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initCoreInjections();
  
}

Future<void> initCoreInjections() async {
  sl.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  await sl.isReady<SharedPreferences>();

  sl.registerLazySingleton<AppSharedPrefs>(() => AppSharedPrefs(sl()));
}
