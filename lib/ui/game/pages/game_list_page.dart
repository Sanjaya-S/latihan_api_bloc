import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_api_bloc/ui/game/bloc/index/game_index_bloc.dart';

class GameListPage extends StatelessWidget {
  const GameListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game List'),
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
      ),
      body: BlocProvider(
        create: (context) =>
        GameIndexBloc()
          ..add(GetGames()),
        child: BlocBuilder<GameIndexBloc, GameIndexState>(
          builder: (context, state) {
            if(state is GameIndexLoading){
              return Center(child: CircularProgressIndicator(),);
            }else if(state is GameIndexError){
              return Center(child: Text(state.message),);
            }else if(state is GameIndexLoaded){
              return ListView.builder(itemCount: state.list.length,
                  itemBuilder: (context, index){
                return ListTile(title: Text(state.list[index].name),);
                  });
            }
            return Container();
          },
        ),
      ),
    );
  }
}
