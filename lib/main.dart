import 'package:core/localization/app_localization.dart';
import 'package:core_ui/core_ui.dart';
import 'package:feature/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/locator_service.dart' as di;
import 'package:pokemon/locator_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonListCubit>(
            create: (context) => sl<PokemonListCubit>()..loadPokemon()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        supportedLocales: const [
          Locale('en', 'US'),
        ],
        localizationsDelegates: const [
          AppLocalization.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode &&
                supportedLocale.countryCode == locale?.countryCode) {
              return supportedLocale;
            }
          }

          return supportedLocales.first;
        },
        home: const HomePage(),
      ),
    );
  }
}
