part of 'player_cubit.dart';

final List<Map<String, dynamic>> footballPlayers = [
  {"name": "Lionel Messi", "country": "Argentina"},
  {"name": "Cristiano Ronaldo", "country": "Portugal"},
  {"name": "Kylian Mbappé", "country": "France"},
  {"name": "Neymar Jr.", "country": "Brazil"},
  {"name": "Kevin De Bruyne", "country": "Belgium"},
  {"name": "Harry Kane", "country": "England"},
  {"name": "Robert Lewandowski", "country": "Poland"},
  {"name": "Luka Modrić", "country": "Croatia"},
  {"name": "Mohamed Salah", "country": "Egypt"},
  {"name": "Virgil van Dijk", "country": "Netherlands"},
  {"name": "Erling Haaland", "country": "Norway"},
  {"name": "Sadio Mané", "country": "Senegal"},
  {"name": "Gavi", "country": "Spain"},
  {"name": "Heung-min Son", "country": "South Korea"},
  {"name": "Alphonso Davies", "country": "Canada"},
  {"name": "Christian Pulisic", "country": "United States"},
  {"name": "Paulo Dybala", "country": "Argentina"},
  {"name": "Pedri", "country": "Spain"},
  {"name": "Thibaut Courtois", "country": "Belgium"},
  {"name": "Karim Benzema", "country": "France"}
];

sealed class PlayerState {}

final class PlayerInitialState extends PlayerState {
  final List<Map<String, dynamic>> players;

  PlayerInitialState(this.players);
}

final class PlayerFilteredState extends PlayerState {
  final List<Map<String, dynamic>> filteredPlayers;

  PlayerFilteredState(this.filteredPlayers);
}
