import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../repository/data_manager.dart';
part 'main_screen_events.dart';
part 'main_screen_state.dart';
class MainScreenBloc extends Bloc<MainScreenEvents, MainScreenState> {
  final DataManager dataManager;

  MainScreenBloc(this.dataManager) : super(MainScreenState()) {
    on<UpdatePageIndexEvent>(_updatePageIndexEvent);

  }

  void _updatePageIndexEvent(UpdatePageIndexEvent event, Emitter<MainScreenState> emit){
    emit(state.copyWith(currentIndex: event.index));

  }

}