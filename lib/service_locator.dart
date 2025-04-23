import 'package:e_commerce_task/core/services/api_services.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  sl.registerLazySingleton<ApiServices>(() => ApiServices());
}
