part of 'all_products_bloc.dart';
@immutable
class AllProductsState extends Equatable {
  final bool loading;
  final ApiRequestStatus apiRequestStatus;
  final List<Product> products;
  final String errorMessage;
  final int total;
  const AllProductsState({
    this.loading = false,
    this.apiRequestStatus = const InitialApiRequestStatus(),
    this.products = const [],
    this.errorMessage = '',
    this.total = 0,

});

  @override
  List<Object> get props => [loading, products, errorMessage, total, apiRequestStatus];


  AllProductsState copyWith ({
    bool? loading,
    ApiRequestStatus? apiRequestStatus,
    List<Product>? products,
    String? errorMessage,
    int? total,

  }){
    return AllProductsState(
      loading: loading ?? this.loading,
        products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      total: total ??  this.total,
      apiRequestStatus: apiRequestStatus ?? this.apiRequestStatus

    );

  }

}