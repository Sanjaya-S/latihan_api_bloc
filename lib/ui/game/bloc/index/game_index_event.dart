part of 'game_index_bloc.dart';

@immutable
sealed class GameIndexEvent {}

final class GetGames extends GameIndexEvent{}