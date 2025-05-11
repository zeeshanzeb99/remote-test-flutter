part of 'favourite_bloc.dart';

abstract class FavouriteEvent {}

class GetFavItemEvent extends FavouriteEvent {}

class RemoveFavItemEvent extends FavouriteEvent {
  final int index;

  RemoveFavItemEvent(this.index);
}

class SearchFav extends FavouriteEvent {
  final String title;

  SearchFav({required this.title});
}