import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:latihan_api_bloc/core/api_client.dart';
import 'package:latihan_api_bloc/data/models/game_models.dart';
import 'package:latihan_api_bloc/data/params/game_param.dart';
import 'package:latihan_api_bloc/data/response/game_create_response.dart';

class GameRepository extends ApiClient {
  Future<List<GameModel>> fetchGames() async {
    try{
      var response = await dio.get('games');
      debugPrint('GET ALL games : ${response.data}');
      List list = response.data;
      List<GameModel> listgameModel =
        list.map((element) => GameModel.fromJson(element)).toList();
      return listgameModel;
    } on DioException catch(e){
      throw Exception(e);
    }
  }

  Future<GameCreateResponse> createGame(GameParam gameParam) async{
    try{
      var response = await dio.post('games');
      debugPrint('POST Response : ${response.data}');
      return GameCreateResponse.fromJson(response.data);
    }on DioException catch (e) {
      throw Exception(e);
    }
  }
}