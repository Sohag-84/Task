part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

final class ProductFetchedEvent extends ProductEvent {
  final String endPoint;
  final bool isRefresh;

  const ProductFetchedEvent({required this.endPoint, this.isRefresh = false});

  @override
  List<Object> get props => [endPoint, isRefresh];
}
