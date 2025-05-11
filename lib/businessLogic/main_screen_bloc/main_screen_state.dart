
part of 'main_screen_bloc.dart';

@immutable
class MainScreenState extends Equatable {

  final int currentIndex;

  const MainScreenState({
    this.currentIndex = 0
});

  @override
  List<Object> get props => [currentIndex];


  MainScreenState copyWith ({
    int? currentIndex,

}){
    return MainScreenState(
      currentIndex: currentIndex ?? this.currentIndex,
    );

}

}