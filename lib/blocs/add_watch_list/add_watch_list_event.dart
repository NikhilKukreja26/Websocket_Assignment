part of 'add_watch_list_bloc.dart';

abstract class AddWatchListEvent extends Equatable {
  const AddWatchListEvent();

  @override
  List<Object> get props => [];
}

@immutable
class AddNewWatchListEvent extends AddWatchListEvent {
  final String title;

  const AddNewWatchListEvent({
    required this.title,
  });

  @override
  String toString() => 'AddNewWatchListEvent(title: $title)';

  @override
  List<Object> get props => [title];
}
