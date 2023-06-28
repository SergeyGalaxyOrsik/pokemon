import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/data.dart';
import 'package:domain/repositories/pokemon_repositories.dart';
import 'package:domain/usecases/get_all_pokemons.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async{
  // Cubit
  sl.registerFactory(
    () => PokemonListCubit(
      getAllPokemons: sl(),
    ),
  );

  // UseCases

  sl.registerLazySingleton(() => GetAllPokemons(sl()));

  // Repository

  sl.registerLazySingleton<PokemonRepository>(() => PokemonRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<PokemonRemoteProvider>(
    () => PokemonRemoteProviderImpl(
      client: http.Client(),
    ),
  );

  sl.registerLazySingleton<PokemonLocalProvider>(
    () => PokemonLocalProviderImpl(
      sharedPreferences: sl(),
    ),
  );
  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      sl(),
    ),
  );
  
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}