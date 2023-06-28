import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

@Route
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
