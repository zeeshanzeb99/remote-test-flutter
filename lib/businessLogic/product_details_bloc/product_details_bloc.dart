import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../dataProvider/models/response/product.dart';
import '../../helper/util/api_status.dart';
import '../../repository/data_manager.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final DataManager dataManager;
  ProductDetailsBloc(this.dataManager) : super(ProductDetailsState()) {
    on<FetchProductDetailsEvent>(_fetchProductDetailsEvent);
    on<SetFavourite>(_setFavourite);



  }

  Future<void> _fetchProductDetailsEvent(
      FetchProductDetailsEvent event, Emitter<ProductDetailsState> emit) async {
    emit(state.copyWith(apiRequestStatus: ApiRequestStatusLoading()));

    try {
      final product = await dataManager.getProductDetails(event.id);
      emit(state.copyWith(apiRequestStatus: ApiRequestStatusSuccess(),product: product));
    } catch (e) {
      emit(state.copyWith(apiRequestStatus: ApiRequestStatusFailure(0,  e.toString())));
    }
  }

  void _setFavourite(
      SetFavourite event, Emitter<ProductDetailsState> emit){
    emit(state.copyWith(isFavourite: event.value));
  }

}