import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/feature/presentation/bloc/pokemon_list_cubit/pokemon_list_cubit.dart';
import 'package:pokemon/feature/presentation/pages/pokemons_home_screen.dart';
import 'package:pokemon/locator_service.dart' as di;
import 'package:pokemon/locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonListCubit>(create: (context) => sl<PokemonListCubit>()..loadPokemon()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: HomePage(),
      ),
    );
  }
}
