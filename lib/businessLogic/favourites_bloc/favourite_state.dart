part of 'favourite_bloc.dart';

@immutable
class FavouriteState extends Equatable {
  final List<Favourite> favourite;
  const FavouriteState({
    this.favourite = const [],

  });

  @override
  List<Object> get props => [favourite];


  FavouriteState copyWith ({
    List<Favourite>? favourite,
  }){
    return FavouriteState(
        favourite: favourite ??  this.favourite,
    );

  }

}