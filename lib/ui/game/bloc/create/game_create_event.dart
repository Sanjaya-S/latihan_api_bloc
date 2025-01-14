part of 'game_create_bloc.dart';

@immutable
sealed class GameCreateEvent {}

final class GameCreatePressed extends GameCreateEvent{
  final GameParam gameParam;
  GameCreatePressed({required this.gameParam});
}
