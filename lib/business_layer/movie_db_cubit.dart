import 'package:bloc/bloc.dart' ;
import 'package:meta/meta.dart';

import '../data_layer/models/models.dart';
import '../data_layer/repositry/repositry.dart';

part 'movie_db_state.dart';

class MovieDbCubit extends Cubit<MovieDbState> {
  List<Models> modelsList = [];
  final Repositry repoSitry;

  MovieDbCubit(this.repoSitry) : super(MovieDbInitial());

  List <dynamic> getAllData() {
   final movies= repoSitry.fetchData().then((data) {
      emit(ModelsLoaded(data));
      this.modelsList == data ;
    });
    return modelsList;
  }
}
