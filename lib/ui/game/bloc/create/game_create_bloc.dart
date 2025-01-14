import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:latihan_api_bloc/data/params/game_param.dart';
import 'package:latihan_api_bloc/data/repo/game_repository.dart';
import 'package:latihan_api_bloc/data/response/game_create_response.dart';
import 'package:meta/meta.dart';

part 'game_create_event.dart';
part 'game_create_state.dart';

class GameCreateBloc extends Bloc<GameCreateEvent, GameCreateState> {
  final gameRepository = GameRepository();
  GameCreateBloc() : super(GameCreateInitial()) {
    on<GameCreatePressed>(_onGameCreatePressed);
    }

  void _onGameCreatePressed(
      GameCreatePressed event, Emitter<GameCreateState> emit) async {
    final gameParam = GameParam(
      name: event.gameParam.name,
      price: event.gameParam.price,
      status: event.gameParam.status);
    emit(GameCreateLoading());
    try{
      GameCreateResponse response = await gameRepository.createGame(gameParam);
      emit(GameCreateSuccess(gameCreateResponse: response));
    } catch (e) {
      emit(GameCreateError(message: e.toString()));
    }
  }
}
}
