import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PokemonCacgeImage extends StatelessWidget {
  final String imageUrl;
  const PokemonCacgeImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    // return CachedNetworkImage(
    //   imageUrl: imageUrl,
    //   imageBuilder: (context, imageProvider) {
    //     return Container(
    //       decoration: BoxDecoration(
    //         image: DecorationImage(image: imageProvider),
    //       ),
    //     );
    //   },
    //   placeholder: (context, url) {
    //     return Center(
    //       child: const CircularProgressIndicator(),
    //     );
    //   },
    //   errorWidget: (context, url, error) {
    //     return Container(child: Image.asset('assets/images/noImage.png'));
    //   },
    // );
    return CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Image.asset('assets/images/noImage.png'),
     );
  }
}
