import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/widgets/pokemon_full_card_widget.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final PokemonEntity pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> typeColor = {
      'bug': AppColors.bug,
      'dark': AppColors.dark,
      'dragon': AppColors.dragon,
      'electric': AppColors.electric,
      'fairy': AppColors.fairy,
      'fighting': AppColors.fighting,
      'fire': AppColors.fire,
      'fluing': AppColors.flying,
      'ghost': AppColors.ghost,
      'normal': AppColors.normal,
      'grass': AppColors.grass,
      'ground': AppColors.ground,
      'ice': AppColors.ice,
      'poison': AppColors.poison,
      'psychic': AppColors.psychic,
      'rock': AppColors.rock,
      'steel': AppColors.steel,
      'water': AppColors.water
    };
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonFullCard(
              backgroundColor: typeColor[pokemon.types[0]['type']['name']],
              pokemon: pokemon,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  AppColors.greyLight,
                  // AppColors.greyWhite,
                  typeColor[pokemon.types[0]['type']['name']]
                ],
              ),
              borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_10)),
          child: Row(
            children: [
              Text(
                pokemon.name,
                style: AppFonts.subtitleBold14,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                '#${pokemon.id}',
                style: AppFonts.subtitleBold10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
