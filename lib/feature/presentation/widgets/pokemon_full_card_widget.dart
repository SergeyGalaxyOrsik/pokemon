import 'package:cached_network_image/cached_network_image.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemon/feature/presentation/widgets/pokemon_cache_image_widget.dart';

class PokemonFullCard extends StatelessWidget {
  final PokemonEntity pokemon;
  final Color backgroundColor;

  const PokemonFullCard(
      {super.key, required this.backgroundColor, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: backgroundColor),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: CachedNetworkImage(
                imageUrl: pokemon.sprites,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),

                //  In order for the application to not give an 
                //  error when running in debug mode when there is no 
                //  Internet, you need to turn off the setting "Uncaught Exceptions"
                errorWidget: (context, url, error) =>
                    Image.asset('assets/images/noImage.png'),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(pokemon.name, style: AppFonts.headlineBold),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text('${pokemon.weight / 10} kg · ', style: AppFonts.body14),
              Text('${pokemon.height * 10} cm', style: AppFonts.body14)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text('Type: ${pokemon.types}', style: AppFonts.body14)
        ],
      ),
    );
  }
}
