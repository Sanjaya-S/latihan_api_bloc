part of 'game_index_bloc.dart';

@immutable
sealed class GameIndexState {}

final class GameIndexInitial extends GameIndexState {}

final class GameIndexLoading extends GameIndexState {}

final class GameIndexLoaded extends GameIndexState {
  final List<GameModel> list;
  GameIndexLoaded({required this.list});
}

final class GameIndexError extends GameIndexState {
  final String message;
  GameIndexError({required this.message});
}
