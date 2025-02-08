import 'package:filter_list_view/cubit/player_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<PlayerCubit>(
        create: (context) => PlayerCubit(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 20, 216),
        title: const Text(
          'Search Names of Footballers',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (name) {
                context.read<PlayerCubit>().filteredPlayers(name);
              },
              decoration: const InputDecoration(
                labelText: 'Search for a player...',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: BlocBuilder<PlayerCubit, PlayerState>(
                builder: (context, state) {
                  if (state is PlayerInitialState) {
                    return buildPlayerList(state.players);
                  } else if (state is PlayerFilteredState) {
                    return buildPlayerList(state.filteredPlayers);
                  }

                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPlayerList(List<Map<String, dynamic>> players) {
    return ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          final player = players[index];
          return ListTile(
            title: Text(
              player['name'],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(player['country'],
                style: const TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 28, 26, 26))),
            // trailing: CircleAvatar(backgroundImage: NetworkImage('url'),),
          );
        });
  }
}
