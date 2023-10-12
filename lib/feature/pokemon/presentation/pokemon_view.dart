import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../presentation/common_widget/loading_widget.dart';
import '../models/pokemon.dart';
import '../repositories/pokemon_repository.dart';

final pokemonFetchProvider = FutureProvider.autoDispose<Pokemon>((ref) async {
  final repository = ref.watch(pokemonRepositoryProvider);
  return repository.fetch();
});


class PokemonViewPage extends ConsumerWidget {
  const PokemonViewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

   final pokemonAsync = ref.watch(pokemonFetchProvider);

    return Scaffold(
      body: Center(
        child: pokemonAsync.when(
          data: (pokemon) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'ポケモンの名前',
              ),
              Text(
                pokemon.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          loading: () => loadingWidget,
          error: (error, stackTrace) => Text(error.toString()),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
