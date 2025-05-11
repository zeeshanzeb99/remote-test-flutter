import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/helper/util/api_status.dart';
import '../../dataProvider/models/response/category.dart';
import '../../dataProvider/models/response/product.dart';
import '../../repository/data_manager.dart';
part 'category_details_state.dart';
part 'category_details_event.dart';

class CategoryDetailsBloc extends Bloc<CategoryDetailsEvent, CategoryDetailsState> {
  final DataManager dataManager;

  CategoryDetailsBloc(this.dataManager) : super(CategoryDetailsState()) {
    on<FetchCategoryProductsEvent>(_fetchAllCategoriesEvent);
    on<SearchCategory>(searchProductsEvent);

  }

  Future<void> _fetchAllCategoriesEvent(
      FetchCategoryProductsEvent event, Emitter<CategoryDetailsState> emit) async {
    emit(state.copyWith(apiRequestStatus: ApiRequestStatusLoading()));

    try {
      final products = await dataManager.getCategoryProducts(event.category.url);
      emit(state.copyWith(products: products, total: products.length));
    } catch (e) {
      emit(state.copyWith(apiRequestStatus: ApiRequestStatusFailure(0, e.toString())));
    } finally {
      emit(state.copyWith(apiRequestStatus: ApiRequestStatusFailure(0, "Something went wrong")));
    }
  }
  Future<void> searchProductsEvent(SearchCategory event, Emitter<CategoryDetailsState> emit) async {
    emit(state.copyWith(apiRequestStatus: ApiRequestStatusLoading()));
    final filteredProducts = state.products.where((product) =>
    product.title?.toLowerCase().contains(event.title?.toLowerCase() ?? "") ?? false
    ).toList();
    emit(state.copyWith(products: filteredProducts,apiRequestStatus: ApiRequestStatusSuccess()));
  }
}
