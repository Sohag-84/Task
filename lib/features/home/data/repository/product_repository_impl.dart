import 'package:e_commerce_task/core/error/failure.dart';
import 'package:e_commerce_task/features/home/data/data%20sources/product_remote_data_sources.dart';
import 'package:e_commerce_task/features/home/data/model/product_model.dart';
import 'package:e_commerce_task/features/home/domain/repository/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;
  const ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  Future<Either<Failure, List<Product>>> getProducts({
    required String endPoint,
    required int page,
  }) async {
    final result = await productRemoteDataSource.getProducts(
      endPoint: endPoint,
      page: page,
    );
    return right(result);
  }
}
