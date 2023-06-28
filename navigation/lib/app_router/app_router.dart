import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/data.dart';
import 'package:feature/feature.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: PokemonFullCard),
    AutoRoute(page: HomePage, initial: true),
  ],
)
class $AppRouter {}

