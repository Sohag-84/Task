import 'dart:async';
import 'dart:io';

import 'package:e_commerce_task/features/home/data/model/product_model.dart';
import 'package:e_commerce_task/features/home/domain/usecase/get_product_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductUsecase getProductUsecase;
  int currentPage = 1;
  bool hasReachedMax = false;
  bool isFetching = false;
  List<Product> productList = [];

  ProductBloc({required this.getProductUsecase}) : super(ProductInitial()) {
    on<ProductFetchedEvent>(_onProductFetched);
  }

  FutureOr<void> _onProductFetched(
    ProductFetchedEvent event,
    Emitter<ProductState> emit,
  ) async {
    if (isFetching || (hasReachedMax && !event.isRefresh)) return;

    isFetching = true;

    if (event.isRefresh) {
      currentPage = 1;
      hasReachedMax = false;
      productList.clear();
    }

    if (currentPage == 1) {
      emit(ProductLoading());
    }

    try {
      final result = await getProductUsecase(
        ProductPaginationParams(endPoint: event.endPoint, page: currentPage),
      );

      result.fold(
        (failure) {
          isFetching = false;
          emit(ProductLoadingFailed(message: failure.message));
        },
        (products) {
          isFetching = false;
          if (products.isEmpty) {
            hasReachedMax = true;
          } else {
            currentPage++;
            productList.addAll(products);
          }

          emit(
            ProductLoaded(
              productList: List.from(productList),
              hasReachedMax: hasReachedMax,
            ),
          );
        },
      );
    } on SocketException {
      isFetching = false;
      emit(const ProductLoadingFailed(message: "No internet connection"));
    } catch (e) {
      isFetching = false;
      emit(ProductLoadingFailed(message: e.toString()));
    }
  }
}
