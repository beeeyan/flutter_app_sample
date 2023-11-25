import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_widget/loading_widget.dart';
import '../models/pokemon.dart';
import '../repositories/pokemon_repository.dart';

final pokemonFetchProvider =
    FutureProvider.autoDispose.family<Pokemon?, String>((ref, no) async {
  // 入力がない場合
  if (no.isEmpty) {
    return null;
  }
  // 数値に変換
  final numNo = int.tryParse(no);

  // 数値に変換できない場合
  // またはポケモン図鑑の番号に相当しない場合
  if (numNo == null || numNo < 1 || numNo > 1010) {
    return null;
  }

  final repository = ref.watch(pokemonRepositoryProvider);
  return repository.fetch(no);
});

class PokemonViewPage extends HookConsumerWidget {
  const PokemonViewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final no = useState('25');
    final pokemonAsync = ref.watch(pokemonFetchProvider(no.value));

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '図鑑No.',
            ),
            const Gap(10),
            SizedBox(
              width: 100,
              child: TextFormField(
                initialValue: no.value,
                onChanged: (value) {
                  no.value = value;
                },
                decoration: const InputDecoration(
                  hintText: 'ポケモンのNoを入力してください',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const Gap(20),
            const Text(
              'ポケモンの名前',
            ),
            const Gap(10),
            pokemonAsync.when(
              data: (pokemon) => Text(
                pokemon?.name ?? '入力データが不正です',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              loading: () => loadingWidget,
              error: (error, stackTrace) => Text(
                error.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
