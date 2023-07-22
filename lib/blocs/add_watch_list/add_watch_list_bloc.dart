import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'add_watch_list_event.dart';
part 'add_watch_list_state.dart';

class AddWatchListBloc extends Bloc<AddWatchListEvent, AddWatchListState> {
  AddWatchListBloc() : super(AddWatchListState.initial()) {
    on<AddNewWatchListEvent>(_onAddNewWatchList);
  }

  void _onAddNewWatchList(
    AddNewWatchListEvent event,
    Emitter<AddWatchListState> emit,
  ) {
    final String newTitle = event.title;
    final List<String> newWatchLists = [...state.watchLists, newTitle];
    emit(state.copyWith(watchLists: newWatchLists));
  }
}
