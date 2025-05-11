
part of 'category_bloc.dart';

@immutable
class CategoryState extends Equatable {

  final ApiRequestStatus apiRequestStatus;
  final bool loading;
  final List<Category> categories;
  final String errorMessage;
  final int total;

  const CategoryState({
    this.apiRequestStatus = const InitialApiRequestStatus(),
    this.loading = false,
    this.categories = const [],
    this.errorMessage = '',
    this.total = 0,

  });


  @override
  List<Object> get props => [loading, categories, errorMessage, total, apiRequestStatus];


  CategoryState copyWith ({
    bool? loading,
    List<Category>? categories,
    String? errorMessage,
    int? total,
    ApiRequestStatus? apiRequestStatus,

  }){
    return CategoryState(
      loading: loading ?? this.loading,
      categories: categories ?? this.categories,
      errorMessage: errorMessage ?? this.errorMessage,
      total: total ??  this.total,
      apiRequestStatus: apiRequestStatus ?? this.apiRequestStatus

    );

  }

}