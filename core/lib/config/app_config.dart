// enum Flavor {
//   dev,
// }

class AppConfig {
  // final Flavor flavor;
  final String baseUrl= 'https://pokeapi.co/api/v2/pokemon?limit=20&offset=';
  // final String webSocketUrl;

  AppConfig();

  // factory AppConfig.fromFlavor(Flavor flavor) {
  //   String webSocketUrl;
  //   switch (flavor) {
  //     case Flavor.dev:
  //       webSocketUrl = '';
  //       break;
  //   }

  //   return AppConfig(
  //     flavor: flavor,
  //     webSocketUrl: webSocketUrl,
  //   );
  // }
}
