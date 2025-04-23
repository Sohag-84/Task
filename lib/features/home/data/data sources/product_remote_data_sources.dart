import 'package:e_commerce_task/core/services/api_services.dart';
import 'package:e_commerce_task/features/home/data/model/product_model.dart';
import 'package:e_commerce_task/service_locator.dart';

abstract interface class ProductRemoteDataSource {
  Future<List<Product>> getProducts({
    required String endPoint,
    required int page,
  });
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final apiServices = sl<ApiServices>();
  @override
  Future<List<Product>> getProducts({
    required String endPoint,
    required int page,
  }) async {
    try {
      final response = await apiServices.getApi(
        endPoint: "$endPoint?page=$page",
      );
      if (response['data'] != null) {
        final List<dynamic> product = response['data'];
        return product.map((json) => Product.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Unexpected error from product api: $e');
    }
  }
}
