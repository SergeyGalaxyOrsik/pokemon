import 'package:core_ui/core_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon/feature/presentation/widgets/pokemons_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pokémon',
          style: AppFonts.headlineBold,
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryPok,
      ),
      body: PokemonList(),
    );
  }
}
