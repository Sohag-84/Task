import 'package:e_commerce_task/core/error/failure.dart';
import 'package:e_commerce_task/features/home/data/model/product_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts({
    required String endPoint,
    required int page,
  });
}
