part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

final class ProductFetchedEvent extends ProductEvent {
  final bool isRefresh;

  const ProductFetchedEvent({this.isRefresh = false});

  @override
  List<Object> get props => [isRefresh];
}
