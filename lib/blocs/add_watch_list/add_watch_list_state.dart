part of 'add_watch_list_bloc.dart';

@immutable
class AddWatchListState extends Equatable {
  final List<String> watchLists;

  const AddWatchListState({
    required this.watchLists,
  });

  factory AddWatchListState.initial() {
    return const AddWatchListState(
      watchLists: [
        'Watchlist',
        'Watchlist 1',
      ],
    );
  }

  AddWatchListState copyWith({
    List<String>? watchLists,
  }) {
    return AddWatchListState(
      watchLists: watchLists ?? this.watchLists,
    );
  }

  @override
  String toString() => 'AddWatchListState(watchLists: $watchLists)';

  @override
  List<Object> get props => [watchLists];
}
