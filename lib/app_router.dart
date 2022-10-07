import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_db_iti_task/business_layer/movie_db_cubit.dart';
import 'package:movie_app_db_iti_task/data_layer/api_services/api_servcies.dart';
import 'package:movie_app_db_iti_task/data_layer/models/models.dart';
import 'package:movie_app_db_iti_task/data_layer/repositry/repositry.dart';
import 'package:movie_app_db_iti_task/presentation_layer/screens/detail_screen.dart';
import 'package:movie_app_db_iti_task/presentation_layer/screens/home_screen.dart';
import 'package:bloc/bloc.dart';

import 'constans/strings/strings.dart';

class AppRouter {
  late Repositry repositry;
  late MovieDbCubit movieDbCubit;

  AppRouter() {
    repositry = Repositry(ApiServices());
    movieDbCubit = MovieDbCubit(repositry);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext ctx) => movieDbCubit,
            child: const HomeScreen(),
          ),
        );
      case detailScreen:
        final movieId = settings.arguments as Models;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext ctx) => movieDbCubit,
                  child:  DetalScreen(models: movieId,),
                ));
    }
    return null;
  }
}
