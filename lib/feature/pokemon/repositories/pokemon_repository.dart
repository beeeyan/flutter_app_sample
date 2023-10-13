import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../api/api_client/abstract_api_client.dart';
import '../../../api/api_client/api_client.dart';
import '../../../api/api_client/api_client_http.dart';
import '../../../util/app_exception.dart';
import '../base_url.dart';
import '../models/pokemon.dart';

final pokemonRepositoryProvider = Provider(
  (ref) => PokemonRepository(
    client: ref.watch(apiClientHttpProvider),
  ),
);

class PokemonRepository {
  PokemonRepository({required this.client});

  final AbstractApiClient client;

  Future<Pokemon> fetch() async {
    final response = await client.get('$pokeApiRoute/pokemon/25');

    final result = response.when(
      success: (data) {
        return Pokemon.fromJson(data.main);
      },
      failure: (message) => throw AppException(message: message),
    );

    return result;
  }
}
