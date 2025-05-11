import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dataProvider/models/response/category.dart';
import '../../dataProvider/models/response/main_response_model.dart';
import '../../dataProvider/models/response/product.dart';
import '../../helper/util/api_status.dart';
import '../../repository/data_manager.dart';

part 'category_state.dart';
part 'category_event.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final DataManager dataManager;

  CategoryBloc(this.dataManager) : super(CategoryState()) {
    on<FetchAllCategoriesEvent>(_fetchAllCategoriesEvent);
    on<SearchCat>(searchCategory);

  }

  Future<void> _fetchAllCategoriesEvent(
      FetchAllCategoriesEvent event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(apiRequestStatus: ApiRequestStatusLoading()));

    try {
      final categories = await dataManager.getCategories();
      emit(state.copyWith(apiRequestStatus: ApiRequestStatusSuccess(),categories: categories, total: categories.length));
    } catch (e) {
      emit(state.copyWith(apiRequestStatus: ApiRequestStatusFailure(0,  e.toString())));
    } finally {
      emit(state.copyWith(apiRequestStatus: ApiRequestStatusFailure(0,  "Something went wrong")));
    }
  }
  Future<void> searchCategory(SearchCat event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(apiRequestStatus: ApiRequestStatusLoading()));
    final filteredCat = state.categories.where((product) =>
    product.slug?.toLowerCase().contains(event.title?.toLowerCase() ?? "") ?? false
    ).toList();
    emit(state.copyWith(categories: filteredCat,apiRequestStatus: ApiRequestStatusSuccess()));
  }
}
