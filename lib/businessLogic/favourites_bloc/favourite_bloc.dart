import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../dataProvider/models/response/favourite.dart';
import '../../helper/util/utils.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteState()) {
    on<GetFavItemEvent>(getFavouriteItems);
    on<RemoveFavItemEvent>(removeFavouriteItem);
    on<SearchFav>(searchFavourite);

  }
  Future<void> getFavouriteItems(
      GetFavItemEvent event, Emitter<FavouriteState> emit) async {
    final item1 = Favourite(id: 1, title: 'Iphone 11', price: 29.99, rating: 4.5);
    final item2 = Favourite(id: 2, title: 'Iphone 12 ', price: 19.99, rating: 4.0);
    final item3 = Favourite(id: 3, title: 'Iphone 9', price: 39.99, rating: 4.8);
    final favItems = [item1, item2, item3];
    emit(FavouriteState(favourite: favItems));
  }

  Future<void> removeFavouriteItem(
      RemoveFavItemEvent event, Emitter<FavouriteState> emit) async {
    final currentList = List<Favourite>.from(state.favourite);
    currentList.removeWhere((item) => item.id == event.index);
    emit(FavouriteState(favourite: currentList));
  }
  Future<void> searchFavourite(SearchFav event, Emitter<FavouriteState> emit) async {
    final filteredCat = state.favourite.where((fav) =>
    fav.title?.toLowerCase().contains(event.title?.toLowerCase() ?? "") ?? false
    ).toList();
    emit(state.copyWith(favourite: filteredCat));
  }
}
