import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_project/dataProvider/models/response/product.dart';
import 'package:flutter_project/helper/util/utils.dart';
import '../../helper/util/api_status.dart';
import '../../repository/data_manager.dart';
part 'all_products_event.dart';
part 'all_products_state.dart';

class AllProductsBloc extends Bloc<AllProductsEvent, AllProductsState> {
  final DataManager dataManager;
  AllProductsBloc(this.dataManager) : super(AllProductsState()) {
    on<FetchProductsEvent>(_fetchProductsEvent);
    on<SearchProducts>(searchProductsEvent);

  }

  Future<void> _fetchProductsEvent(FetchProductsEvent event, Emitter<AllProductsState> emit) async {
    emit(state.copyWith(apiRequestStatus: ApiRequestStatusLoading()));
    try{
      await dataManager.getProducts(event.limit,event.title ?? '').then((mainResponse) async {
        if(mainResponse.products != null){
          final products = mainResponse.products;
          final total = mainResponse.total;
          emit(state.copyWith(products: products, total: total,apiRequestStatus: ApiRequestStatusSuccess()));
        } else {
          emit(state.copyWith(errorMessage: 'Something went wrong'));
        }
      });
    }catch(e){
      Utils.console(e.toString());
    }finally{
      emit(state.copyWith(apiRequestStatus: ApiRequestStatusFailure(0, "Something went wrong")));
    }
  }
  Future<void> searchProductsEvent(SearchProducts event, Emitter<AllProductsState> emit) async {
    // emit(state.copyWith(apiRequestStatus: ApiRequestStatusLoading()));
    try {
      await dataManager.searchProduct(event.title).then((mainResponse) async {
        if (mainResponse.products != null) {
          final products = mainResponse.products;
          final total = mainResponse.total;
          emit(state.copyWith(products: products,
              total: total,
              apiRequestStatus: ApiRequestStatusSuccess()));
        } else {
          emit(state.copyWith(errorMessage: 'Something went wrong'));
        }
      });
    } catch (e) {
      Utils.console(e.toString());
    } finally {
      emit(state.copyWith(apiRequestStatus: ApiRequestStatusFailure(
          0, "Something went wrong")));
    }
  }
}