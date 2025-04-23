import 'package:e_commerce_task/core/services/api_services.dart';
import 'package:e_commerce_task/features/home/data/data%20sources/product_remote_data_sources.dart';
import 'package:e_commerce_task/features/home/data/repository/product_repository_impl.dart';
import 'package:e_commerce_task/features/home/domain/repository/product_repository.dart';
import 'package:e_commerce_task/features/home/domain/usecase/get_product_usecase.dart';
import 'package:e_commerce_task/features/home/presentation/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  sl.registerLazySingleton<ApiServices>(() => ApiServices());

  // Remote Data Source inject
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(),
  );

  // Repository inject
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(productRemoteDataSource: sl()),
  );

  // UseCase inject
  sl.registerLazySingleton<GetProductUsecase>(
    () => GetProductUsecase(productRepository: sl()),
  );

  // Bloc inject
  sl.registerLazySingleton(() => ProductBloc(getProductUsecase: sl()));
}
