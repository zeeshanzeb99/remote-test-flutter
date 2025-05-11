

part of 'main_screen_bloc.dart';


abstract class MainScreenEvents {}

class UpdatePageIndexEvent extends MainScreenEvents {
  final int index;
  UpdatePageIndexEvent({required this.index});

}

