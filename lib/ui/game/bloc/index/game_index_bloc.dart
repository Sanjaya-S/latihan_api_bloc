import 'package:bloc/bloc.dart';
import 'package:latihan_api_bloc/data/models/game_models.dart';
import 'package:latihan_api_bloc/data/repo/game_repository.dart';
import 'package:meta/meta.dart';

part 'game_index_event.dart';
part 'game_index_state.dart';

class GameIndexBloc extends Bloc<GameIndexEvent, GameIndexState> {
  final gameRepository = GameRepository();

  GameIndexBloc() : super(GameIndexInitial()) {
    on<GetGames>((event, emit) async {
      emit(GameIndexLoading());
      try {
        List<GameModel> list = await gameRepository.fetchGames();
        emit(GameIndexLoaded(list: list));
      } catch (e){
        emit(GameIndexError(message: e.toString()));
      }
    });
  }
}
