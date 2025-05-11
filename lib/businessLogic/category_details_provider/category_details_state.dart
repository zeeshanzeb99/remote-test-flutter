
part of 'category_details_bloc.dart';

@immutable
class CategoryDetailsState extends Equatable {

  final ApiRequestStatus apiRequestStatus;
  final bool loading;
  final List<Product> products;
  final String errorMessage;
  final int total;

  const CategoryDetailsState({
    this.loading = false,
    this.products = const [],
    this.errorMessage = '',
    this.total = 0,
    this.apiRequestStatus = const InitialApiRequestStatus()

  });


  @override
  List<Object> get props => [loading, products, errorMessage, total, apiRequestStatus];


  CategoryDetailsState copyWith ({
    bool? loading,
    List<Product>? products,
    String? errorMessage,
    int? total,
    ApiRequestStatus? apiRequestStatus,

  }){
    return CategoryDetailsState(
      loading: loading ?? this.loading,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      total: total ??  this.total,
      apiRequestStatus: apiRequestStatus ?? this.apiRequestStatus

    );

  }

}