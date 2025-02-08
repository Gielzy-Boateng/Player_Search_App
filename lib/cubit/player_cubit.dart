import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit() : super(PlayerInitialState(footballPlayers));

  void filteredPlayers(String name) {
    if (name.isEmpty) {
      emit(PlayerInitialState(footballPlayers));
    } else {
      final filteredList = footballPlayers
          .where((player) => player['name']
              .toString()
              .toLowerCase()
              .contains(name.toLowerCase()))
          .toList();
      emit(PlayerFilteredState(filteredList));
    }
  }
}
