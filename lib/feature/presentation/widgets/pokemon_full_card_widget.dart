import 'package:cached_network_image/cached_network_image.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemon/feature/presentation/widgets/pokemon_cache_image_widget.dart';

class PokemonFullCard extends StatelessWidget {
  final PokemonEntity pokemon;
  final Color backgroundColor;

  const PokemonFullCard(
      {super.key, required this.backgroundColor, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF),
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
          Image.asset('assets/images/pokeball.png'),
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
                  imageUrl: pokemon.sprites,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/images/noImage.png'),
                ),
                
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColors.greyMedium,
                      borderRadius:
                          BorderRadius.circular(AppDimens.BORDER_RADIUS_10)),
                  child: Text(
                    pokemon.types,
                    style: AppFonts.subtitleBold12Light,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/weight.svg',
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${pokemon.weight / 10} kg',
                              style: AppFonts.body14,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Weight',
                          style: AppFonts.body14,
                        )
                      ],
                    ),
                    const VerticalDivider(),
                    Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/straighten.svg',
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${pokemon.height * 10} cm',
                              style: AppFonts.body14,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Height',
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
