import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/localization/app_localization.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';

class PokemonFullCard extends StatelessWidget {
  final PokemonEntity pokemon;
  final Color backgroundColor;

  const PokemonFullCard(
      {super.key, required this.backgroundColor, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.noColor,
        elevation: 0,
        title: Text(
          pokemon.name,
          style: AppFonts.headlineBold,
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                "#${pokemon.id}",
                style: AppFonts.body14,
              ),
            ),
          )
        ],
      ),
      backgroundColor: backgroundColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          AppImages.pokeball,
          Padding(
            padding: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height / 3.5)),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.greyWhite,
                  borderRadius:
                      BorderRadius.circular(AppDimens.BORDER_RADIUS_8),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: (MediaQuery.of(context).size.height / 12)),
            child: Column(
              children: [
                CachedNetworkImage(
                  height: 250,
                  width: 250,
                  imageUrl: pokemon.sprites.other.officialArtwork.frontDefault,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => AppImages.noImage,
                ),
                
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColors.greyMedium,
                      borderRadius:
                          BorderRadius.circular(AppDimens.BORDER_RADIUS_10)),
                  child: Text(
                    pokemon.types[0]['type']['name'],
                    style: AppFonts.subtitleBold12Light,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            AppImages.weightIcon,
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${pokemon.weight / 10} ${AppLocalization.of(context)?.translate('kg') as String}',
                              style: AppFonts.body14,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          AppLocalization.of(context)!.translate('weight_key') as String,
                          style: AppFonts.body14,
                        )
                      ],
                    ),
                    const VerticalDivider(),
                    Column(
                      children: [
                        Row(
                          children: [
                            AppImages.heightIcon,
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${pokemon.height * 10} ${AppLocalization.of(context)!.translate('cm') as String}',
                              style: AppFonts.body14,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          AppLocalization.of(context)!.translate('height_key') as String,
                          style: AppFonts.body14,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
