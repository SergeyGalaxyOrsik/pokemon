import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonCacgeImage extends StatelessWidget {
  final String imageUrl;
  const PokemonCacgeImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {

    return CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Image.asset('assets/images/noImage.png'),
     );
  }
}
