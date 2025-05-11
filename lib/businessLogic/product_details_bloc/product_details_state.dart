part of 'product_details_bloc.dart';


class ProductDetailsState extends Equatable {
  final bool loading;
  final ApiRequestStatus apiRequestStatus;
  final Product? product;
  final String errorMessage;
  final int total;
  final bool isFavourite;

  const ProductDetailsState({
    this.loading = false,
    this.apiRequestStatus = const InitialApiRequestStatus(),
    this.product,
    this.errorMessage = '',
    this.total = 0,
    this.isFavourite = false,

  });

  @override
  List<Object?> get props => [loading, product, errorMessage, total, apiRequestStatus,isFavourite];


  ProductDetailsState copyWith ({
    bool? loading,
    ApiRequestStatus? apiRequestStatus,
    Product? product,
    String? errorMessage,
    int? total,
    bool? isFavourite,

  }){
    return ProductDetailsState(
        loading: loading ?? this.loading,
        product: product ?? this.product,
        errorMessage: errorMessage ?? this.errorMessage,
        total: total ??  this.total,
        apiRequestStatus: apiRequestStatus ?? this.apiRequestStatus,
        isFavourite: isFavourite ??  this.isFavourite,

    );

  }
  
}

