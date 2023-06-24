import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pokemon/core/platform/network_info.dart';
import 'package:pokemon/feature/data/datasource/pokemon_local_data_source.dart';
import 'package:pokemon/feature/data/datasource/pokemon_remote_data_source.dart';
import 'package:pokemon/feature/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon/feature/domain/repositories/pokemon_repositories.dart';
import 'package:pokemon/feature/domain/usecases/get_all_pokemons.dart';
import 'package:pokemon/feature/presentation/bloc/pokemon_list_cubit/pokemon_list_cubit.dart';
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

  sl.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(
      client: http.Client(),
    ),
  );

  sl.registerLazySingleton<PokemonLocalDataSource>(
    () => PokemonLocalDataSourceImpl(
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
