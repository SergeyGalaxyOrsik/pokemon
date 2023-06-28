// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$$AppRouter extends RootStackRouter {
  _$$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    PokemonFullCard.name: (routeData) {
      final args = routeData.argsAs<PokemonFullCardArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PokemonFullCard(
          key: args.key,
          backgroundColor: args.backgroundColor,
          pokemon: args.pokemon,
        ),
      );
    },
    HomePage.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          PokemonFullCard.name,
          path: '/pokemon-full-card',
        ),
        RouteConfig(
          HomePage.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [PokemonFullCard]
class PokemonFullCard extends PageRouteInfo<PokemonFullCardArgs> {
  PokemonFullCard({
    Key? key,
    required Color backgroundColor,
    required PokemonEntity pokemon,
  }) : super(
          PokemonFullCard.name,
          path: '/pokemon-full-card',
          args: PokemonFullCardArgs(
            key: key,
            backgroundColor: backgroundColor,
            pokemon: pokemon,
          ),
        );

  static const String name = 'PokemonFullCard';
}

class PokemonFullCardArgs {
  const PokemonFullCardArgs({
    this.key,
    required this.backgroundColor,
    required this.pokemon,
  });

  final Key? key;

  final Color backgroundColor;

  final PokemonEntity pokemon;

  @override
  String toString() {
    return 'PokemonFullCardArgs{key: $key, backgroundColor: $backgroundColor, pokemon: $pokemon}';
  }
}

/// generated route for
/// [HomePage]
class HomePage extends PageRouteInfo<void> {
  const HomePage()
      : super(
          HomePage.name,
          path: '/',
        );

  static const String name = 'HomePage';
}
