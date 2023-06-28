import 'package:core_ui/core_ui.dart';
import 'package:feature/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/app_router/app_router.dart';
import 'package:pokemon/locator_service.dart' as di;
import 'package:pokemon/locator_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = $AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonListCubit>(create: (context) => sl<PokemonListCubit>()..loadPokemon()),
      ],
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.default,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        // home: HomePage(),
      ),
    );
  }
}