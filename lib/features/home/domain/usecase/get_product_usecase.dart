import 'package:e_commerce_task/core/error/failure.dart';
import 'package:e_commerce_task/core/usecase/usecase.dart';
import 'package:e_commerce_task/features/home/data/model/product_model.dart';
import 'package:e_commerce_task/features/home/domain/repository/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetProductUsecase
    implements Usecase<List<Product>, ProductPaginationParams> {
  final ProductRepository productRepository;
  const GetProductUsecase({required this.productRepository});

  @override
  Future<Either<Failure, List<Product>>> call(
    ProductPaginationParams params,
  ) async {
    return await productRepository.getProducts(
      endPoint: params.endPoint,
      page: params.page,
    );
  }
}

class ProductPaginationParams {
  final String endPoint;
  final int page;
  const ProductPaginationParams({required this.endPoint, required this.page});
}
